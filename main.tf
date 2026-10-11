resource "oci_disaster_recovery_dr_protection_group" "disaster_recovery_dr_protection_groups" {
  for_each = var.disaster_recovery_dr_protection_groups

  compartment_id       = each.value.compartment_id
  display_name         = each.value.display_name
  defined_tags         = each.value.defined_tags
  disassociate_trigger = each.value.disassociate_trigger
  freeform_tags        = each.value.freeform_tags

  log_location {
    bucket    = each.value.log_location.bucket
    namespace = each.value.log_location.namespace
  }

  dynamic "association" {
    for_each = each.value.association != null ? [each.value.association] : []
    content {
      peer_id     = association.value.peer_id
      peer_region = association.value.peer_region
      role        = association.value.role
    }
  }

  dynamic "members" {
    for_each = each.value.members != null ? each.value.members : []
    content {
      autonomous_database_standby_type_for_dr_drills = members.value.autonomous_database_standby_type_for_dr_drills
      dynamic "backend_set_mappings" {
        for_each = members.value.backend_set_mappings != null ? members.value.backend_set_mappings : []
        content {
          destination_backend_set_name   = backend_set_mappings.value.destination_backend_set_name
          is_backend_set_for_non_movable = backend_set_mappings.value.is_backend_set_for_non_movable
          source_backend_set_name        = backend_set_mappings.value.source_backend_set_name
        }
      }
      dynamic "backup_config" {
        for_each = members.value.backup_config != null ? [members.value.backup_config] : []
        content {
          backup_schedule                   = backup_config.value.backup_schedule
          exclude_namespaces                = backup_config.value.exclude_namespaces
          image_replication_vault_secret_id = backup_config.value.image_replication_vault_secret_id
          max_number_of_backups_retained    = backup_config.value.max_number_of_backups_retained
          namespaces                        = backup_config.value.namespaces
          replicate_images                  = backup_config.value.replicate_images
        }
      }
      dynamic "backup_location" {
        for_each = members.value.backup_location != null ? [members.value.backup_location] : []
        content {
          bucket    = backup_location.value.bucket
          namespace = backup_location.value.namespace
        }
      }
      dynamic "block_volume_attach_and_mount_operations" {
        for_each = members.value.block_volume_attach_and_mount_operations != null ? [members.value.block_volume_attach_and_mount_operations] : []
        content {
          dynamic "attachments" {
            for_each = block_volume_attach_and_mount_operations.value.attachments != null ? block_volume_attach_and_mount_operations.value.attachments : []
            content {
              block_volume_id                         = attachments.value.block_volume_id
              volume_attachment_reference_instance_id = attachments.value.volume_attachment_reference_instance_id
            }
          }
          dynamic "mounts" {
            for_each = block_volume_attach_and_mount_operations.value.mounts != null ? block_volume_attach_and_mount_operations.value.mounts : []
            content {
              mount_point = mounts.value.mount_point
            }
          }
        }
      }
      dynamic "block_volume_operations" {
        for_each = members.value.block_volume_operations != null ? members.value.block_volume_operations : []
        content {
          dynamic "attachment_details" {
            for_each = block_volume_operations.value.attachment_details != null ? [block_volume_operations.value.attachment_details] : []
            content {
              volume_attachment_reference_instance_id = attachment_details.value.volume_attachment_reference_instance_id
            }
          }
          block_volume_id = block_volume_operations.value.block_volume_id
          dynamic "mount_details" {
            for_each = block_volume_operations.value.mount_details != null ? [block_volume_operations.value.mount_details] : []
            content {
              mount_point = mount_details.value.mount_point
            }
          }
        }
      }
      bucket = members.value.bucket
      dynamic "common_destination_key" {
        for_each = members.value.common_destination_key != null ? [members.value.common_destination_key] : []
        content {
          encryption_key_id = common_destination_key.value.encryption_key_id
          vault_id          = common_destination_key.value.vault_id
        }
      }
      connection_string_type = members.value.connection_string_type
      dynamic "db_system_admin_user_details" {
        for_each = members.value.db_system_admin_user_details != null ? [members.value.db_system_admin_user_details] : []
        content {
          password_vault_secret_id = db_system_admin_user_details.value.password_vault_secret_id
          username                 = db_system_admin_user_details.value.username
        }
      }
      dynamic "db_system_replication_user_details" {
        for_each = members.value.db_system_replication_user_details != null ? [members.value.db_system_replication_user_details] : []
        content {
          password_vault_secret_id = db_system_replication_user_details.value.password_vault_secret_id
          username                 = db_system_replication_user_details.value.username
        }
      }
      destination_availability_domain     = members.value.destination_availability_domain
      destination_backup_policy_id        = members.value.destination_backup_policy_id
      destination_capacity_reservation_id = members.value.destination_capacity_reservation_id
      destination_compartment_id          = members.value.destination_compartment_id
      destination_dedicated_vm_host_id    = members.value.destination_dedicated_vm_host_id
      dynamic "destination_encryption_key" {
        for_each = members.value.destination_encryption_key != null ? [members.value.destination_encryption_key] : []
        content {
          encryption_key_id = destination_encryption_key.value.encryption_key_id
          vault_id          = destination_encryption_key.value.vault_id
        }
      }
      destination_load_balancer_id         = members.value.destination_load_balancer_id
      destination_network_load_balancer_id = members.value.destination_network_load_balancer_id
      destination_snapshot_policy_id       = members.value.destination_snapshot_policy_id
      dynamic "export_mappings" {
        for_each = members.value.export_mappings != null ? members.value.export_mappings : []
        content {
          destination_mount_target_id = export_mappings.value.destination_mount_target_id
          export_id                   = export_mappings.value.export_id
        }
      }
      dynamic "file_system_operations" {
        for_each = members.value.file_system_operations != null ? members.value.file_system_operations : []
        content {
          export_path = file_system_operations.value.export_path
          dynamic "mount_details" {
            for_each = file_system_operations.value.mount_details != null ? [file_system_operations.value.mount_details] : []
            content {
              mount_target_id = mount_details.value.mount_target_id
            }
          }
          mount_point     = file_system_operations.value.mount_point
          mount_target_id = file_system_operations.value.mount_target_id
          dynamic "unmount_details" {
            for_each = file_system_operations.value.unmount_details != null ? [file_system_operations.value.unmount_details] : []
            content {
              mount_target_id = unmount_details.value.mount_target_id
            }
          }
        }
      }
      gtid_reconciliation_timeout                = members.value.gtid_reconciliation_timeout
      is_continue_on_gtid_reconciliation_timeout = members.value.is_continue_on_gtid_reconciliation_timeout
      is_movable                                 = members.value.is_movable
      is_retain_fault_domain                     = members.value.is_retain_fault_domain
      is_start_stop_enabled                      = members.value.is_start_stop_enabled
      jump_host_id                               = members.value.jump_host_id
      dynamic "load_balancer_mappings" {
        for_each = members.value.load_balancer_mappings != null ? members.value.load_balancer_mappings : []
        content {
          destination_load_balancer_id = load_balancer_mappings.value.destination_load_balancer_id
          source_load_balancer_id      = load_balancer_mappings.value.source_load_balancer_id
        }
      }
      dynamic "managed_node_pool_configs" {
        for_each = members.value.managed_node_pool_configs != null ? members.value.managed_node_pool_configs : []
        content {
          id      = managed_node_pool_configs.value.id
          maximum = managed_node_pool_configs.value.maximum
          minimum = managed_node_pool_configs.value.minimum
        }
      }
      member_id   = members.value.member_id
      member_type = members.value.member_type
      namespace   = members.value.namespace
      dynamic "network_load_balancer_mappings" {
        for_each = members.value.network_load_balancer_mappings != null ? members.value.network_load_balancer_mappings : []
        content {
          destination_network_load_balancer_id = network_load_balancer_mappings.value.destination_network_load_balancer_id
          source_network_load_balancer_id      = network_load_balancer_mappings.value.source_network_load_balancer_id
        }
      }
      password_vault_secret_id = members.value.password_vault_secret_id
      peer_cluster_id          = members.value.peer_cluster_id
      peer_db_system_id        = members.value.peer_db_system_id
      dynamic "resource_modifier_mappings" {
        for_each = members.value.resource_modifier_mappings != null ? members.value.resource_modifier_mappings : []
        content {
          config_map = resource_modifier_mappings.value.config_map
          namespace  = resource_modifier_mappings.value.namespace
        }
      }
      dynamic "source_volume_to_destination_encryption_key_mappings" {
        for_each = members.value.source_volume_to_destination_encryption_key_mappings != null ? members.value.source_volume_to_destination_encryption_key_mappings : []
        content {
          dynamic "destination_encryption_key" {
            for_each = source_volume_to_destination_encryption_key_mappings.value.destination_encryption_key != null ? [source_volume_to_destination_encryption_key_mappings.value.destination_encryption_key] : []
            content {
              encryption_key_id = destination_encryption_key.value.encryption_key_id
              vault_id          = destination_encryption_key.value.vault_id
            }
          }
          source_volume_id = source_volume_to_destination_encryption_key_mappings.value.source_volume_id
        }
      }
      dynamic "vault_mappings" {
        for_each = members.value.vault_mappings != null ? members.value.vault_mappings : []
        content {
          destination_vault_id = vault_mappings.value.destination_vault_id
          source_vault_id      = vault_mappings.value.source_vault_id
        }
      }
      dynamic "virtual_node_pool_configs" {
        for_each = members.value.virtual_node_pool_configs != null ? members.value.virtual_node_pool_configs : []
        content {
          id      = virtual_node_pool_configs.value.id
          maximum = virtual_node_pool_configs.value.maximum
          minimum = virtual_node_pool_configs.value.minimum
        }
      }
      dynamic "vnic_mapping" {
        for_each = members.value.vnic_mapping != null ? members.value.vnic_mapping : []
        content {
          destination_nsg_id_list = vnic_mapping.value.destination_nsg_id_list
          destination_subnet_id   = vnic_mapping.value.destination_subnet_id
          source_vnic_id          = vnic_mapping.value.source_vnic_id
        }
      }
      dynamic "vnic_mappings" {
        for_each = members.value.vnic_mappings != null ? members.value.vnic_mappings : []
        content {
          destination_nsg_id_list                       = vnic_mappings.value.destination_nsg_id_list
          destination_primary_private_ip_address        = vnic_mappings.value.destination_primary_private_ip_address
          destination_primary_private_ip_hostname_label = vnic_mappings.value.destination_primary_private_ip_hostname_label
          destination_reserved_public_ip_id             = vnic_mappings.value.destination_reserved_public_ip_id
          destination_subnet_id                         = vnic_mappings.value.destination_subnet_id
          source_vnic_id                                = vnic_mappings.value.source_vnic_id
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

