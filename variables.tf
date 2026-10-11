variable "disaster_recovery_dr_protection_groups" {
  description = <<EOT
Map of disaster_recovery_dr_protection_groups, attributes below
Required:
    - compartment_id
    - display_name
    - log_location (block):
        - bucket (required)
        - namespace (required)
Optional:
    - defined_tags
    - disassociate_trigger
    - freeform_tags
    - association (block):
        - peer_id (optional)
        - peer_region (optional)
        - role (required)
    - members (block):
        - autonomous_database_standby_type_for_dr_drills (optional)
        - backend_set_mappings (optional, block):
            - destination_backend_set_name (optional)
            - is_backend_set_for_non_movable (optional)
            - source_backend_set_name (optional)
        - backup_config (optional, block):
            - backup_schedule (optional)
            - exclude_namespaces (optional)
            - image_replication_vault_secret_id (optional)
            - max_number_of_backups_retained (optional)
            - namespaces (optional)
            - replicate_images (optional)
        - backup_location (optional, block):
            - bucket (optional)
            - namespace (optional)
        - block_volume_attach_and_mount_operations (optional, block):
            - attachments (optional, block):
                - block_volume_id (optional)
                - volume_attachment_reference_instance_id (optional)
            - mounts (optional, block):
                - mount_point (optional)
        - block_volume_operations (optional, block):
            - attachment_details (optional, block):
                - volume_attachment_reference_instance_id (optional)
            - block_volume_id (optional)
            - mount_details (optional, block):
                - mount_point (optional)
        - bucket (optional)
        - common_destination_key (optional, block):
            - encryption_key_id (optional)
            - vault_id (optional)
        - connection_string_type (optional)
        - db_system_admin_user_details (optional, block):
            - password_vault_secret_id (optional)
            - username (optional)
        - db_system_replication_user_details (optional, block):
            - password_vault_secret_id (optional)
            - username (optional)
        - destination_availability_domain (optional)
        - destination_backup_policy_id (optional)
        - destination_capacity_reservation_id (optional)
        - destination_compartment_id (optional)
        - destination_dedicated_vm_host_id (optional)
        - destination_encryption_key (optional, block):
            - encryption_key_id (optional)
            - vault_id (optional)
        - destination_load_balancer_id (optional)
        - destination_network_load_balancer_id (optional)
        - destination_snapshot_policy_id (optional)
        - export_mappings (optional, block):
            - destination_mount_target_id (optional)
            - export_id (optional)
        - file_system_operations (optional, block):
            - export_path (optional)
            - mount_details (optional, block):
                - mount_target_id (optional)
            - mount_point (optional)
            - mount_target_id (optional)
            - unmount_details (optional, block):
                - mount_target_id (optional)
        - gtid_reconciliation_timeout (optional)
        - is_continue_on_gtid_reconciliation_timeout (optional)
        - is_movable (optional)
        - is_retain_fault_domain (optional)
        - is_start_stop_enabled (optional)
        - jump_host_id (optional)
        - load_balancer_mappings (optional, block):
            - destination_load_balancer_id (optional)
            - source_load_balancer_id (optional)
        - managed_node_pool_configs (optional, block):
            - id (optional)
            - maximum (optional)
            - minimum (optional)
        - member_id (required)
        - member_type (required)
        - namespace (optional)
        - network_load_balancer_mappings (optional, block):
            - destination_network_load_balancer_id (optional)
            - source_network_load_balancer_id (optional)
        - password_vault_secret_id (optional)
        - peer_cluster_id (optional)
        - peer_db_system_id (optional)
        - resource_modifier_mappings (optional, block):
            - config_map (optional)
            - namespace (optional)
        - source_volume_to_destination_encryption_key_mappings (optional, block):
            - destination_encryption_key (optional, block):
                - encryption_key_id (optional)
                - vault_id (optional)
            - source_volume_id (optional)
        - vault_mappings (optional, block):
            - destination_vault_id (optional)
            - source_vault_id (optional)
        - virtual_node_pool_configs (optional, block):
            - id (optional)
            - maximum (optional)
            - minimum (optional)
        - vnic_mapping (optional, block):
            - destination_nsg_id_list (optional)
            - destination_subnet_id (optional)
            - source_vnic_id (optional)
        - vnic_mappings (optional, block):
            - destination_nsg_id_list (optional)
            - destination_primary_private_ip_address (optional)
            - destination_primary_private_ip_hostname_label (optional)
            - destination_reserved_public_ip_id (optional)
            - destination_subnet_id (optional)
            - source_vnic_id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id       = string
    display_name         = string
    defined_tags         = optional(map(string))
    disassociate_trigger = optional(number)
    freeform_tags        = optional(map(string))
    log_location = object({
      bucket    = string
      namespace = string
    })
    association = optional(object({
      peer_id     = optional(string)
      peer_region = optional(string)
      role        = string
    }))
    members = optional(list(object({
      autonomous_database_standby_type_for_dr_drills = optional(string)
      backend_set_mappings = optional(list(object({
        destination_backend_set_name   = optional(string)
        is_backend_set_for_non_movable = optional(bool)
        source_backend_set_name        = optional(string)
      })))
      backup_config = optional(object({
        backup_schedule                   = optional(string)
        exclude_namespaces                = optional(list(string))
        image_replication_vault_secret_id = optional(string)
        max_number_of_backups_retained    = optional(number)
        namespaces                        = optional(list(string))
        replicate_images                  = optional(string)
      }))
      backup_location = optional(object({
        bucket    = optional(string)
        namespace = optional(string)
      }))
      block_volume_attach_and_mount_operations = optional(object({
        attachments = optional(list(object({
          block_volume_id                         = optional(string)
          volume_attachment_reference_instance_id = optional(string)
        })))
        mounts = optional(list(object({
          mount_point = optional(string)
        })))
      }))
      block_volume_operations = optional(list(object({
        attachment_details = optional(object({
          volume_attachment_reference_instance_id = optional(string)
        }))
        block_volume_id = optional(string)
        mount_details = optional(object({
          mount_point = optional(string)
        }))
      })))
      bucket = optional(string)
      common_destination_key = optional(object({
        encryption_key_id = optional(string)
        vault_id          = optional(string)
      }))
      connection_string_type = optional(string)
      db_system_admin_user_details = optional(object({
        password_vault_secret_id = optional(string)
        username                 = optional(string)
      }))
      db_system_replication_user_details = optional(object({
        password_vault_secret_id = optional(string)
        username                 = optional(string)
      }))
      destination_availability_domain     = optional(string)
      destination_backup_policy_id        = optional(string)
      destination_capacity_reservation_id = optional(string)
      destination_compartment_id          = optional(string)
      destination_dedicated_vm_host_id    = optional(string)
      destination_encryption_key = optional(object({
        encryption_key_id = optional(string)
        vault_id          = optional(string)
      }))
      destination_load_balancer_id         = optional(string)
      destination_network_load_balancer_id = optional(string)
      destination_snapshot_policy_id       = optional(string)
      export_mappings = optional(list(object({
        destination_mount_target_id = optional(string)
        export_id                   = optional(string)
      })))
      file_system_operations = optional(list(object({
        export_path = optional(string)
        mount_details = optional(object({
          mount_target_id = optional(string)
        }))
        mount_point     = optional(string)
        mount_target_id = optional(string)
        unmount_details = optional(object({
          mount_target_id = optional(string)
        }))
      })))
      gtid_reconciliation_timeout                = optional(number)
      is_continue_on_gtid_reconciliation_timeout = optional(bool)
      is_movable                                 = optional(bool)
      is_retain_fault_domain                     = optional(bool)
      is_start_stop_enabled                      = optional(bool)
      jump_host_id                               = optional(string)
      load_balancer_mappings = optional(list(object({
        destination_load_balancer_id = optional(string)
        source_load_balancer_id      = optional(string)
      })))
      managed_node_pool_configs = optional(list(object({
        id      = optional(string)
        maximum = optional(number)
        minimum = optional(number)
      })))
      member_id   = string
      member_type = string
      namespace   = optional(string)
      network_load_balancer_mappings = optional(list(object({
        destination_network_load_balancer_id = optional(string)
        source_network_load_balancer_id      = optional(string)
      })))
      password_vault_secret_id = optional(string)
      peer_cluster_id          = optional(string)
      peer_db_system_id        = optional(string)
      resource_modifier_mappings = optional(list(object({
        config_map = optional(string)
        namespace  = optional(string)
      })))
      source_volume_to_destination_encryption_key_mappings = optional(list(object({
        destination_encryption_key = optional(object({
          encryption_key_id = optional(string)
          vault_id          = optional(string)
        }))
        source_volume_id = optional(string)
      })))
      vault_mappings = optional(list(object({
        destination_vault_id = optional(string)
        source_vault_id      = optional(string)
      })))
      virtual_node_pool_configs = optional(list(object({
        id      = optional(string)
        maximum = optional(number)
        minimum = optional(number)
      })))
      vnic_mapping = optional(list(object({
        destination_nsg_id_list = optional(list(string))
        destination_subnet_id   = optional(string)
        source_vnic_id          = optional(string)
      })))
      vnic_mappings = optional(list(object({
        destination_nsg_id_list                       = optional(list(string))
        destination_primary_private_ip_address        = optional(string)
        destination_primary_private_ip_hostname_label = optional(string)
        destination_reserved_public_ip_id             = optional(string)
        destination_subnet_id                         = optional(string)
        source_vnic_id                                = optional(string)
      })))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.disaster_recovery_dr_protection_groups : (
        v.members == null || alltrue([for item in v.members : (contains([for v in ["AUTONOMOUS_CONTAINER_DATABASE", "AUTONOMOUS_DATABASE", "COMPUTE_INSTANCE", "COMPUTE_INSTANCE_MOVABLE", "COMPUTE_INSTANCE_NON_MOVABLE", "DATABASE", "FILE_SYSTEM", "INTEGRATION_INSTANCE", "LOAD_BALANCER", "MYSQL_DB_SYSTEM", "NETWORK_LOAD_BALANCER", "OBJECT_STORAGE_BUCKET", "OKE_CLUSTER", "VOLUME_GROUP"] : lower(v)], lower(item.member_type)))])
      )
    ])
    error_message = "must be one of: \"AUTONOMOUS_CONTAINER_DATABASE\", \"AUTONOMOUS_DATABASE\", \"COMPUTE_INSTANCE\", \"COMPUTE_INSTANCE_MOVABLE\", \"COMPUTE_INSTANCE_NON_MOVABLE\", \"DATABASE\", \"FILE_SYSTEM\", \"INTEGRATION_INSTANCE\", \"LOAD_BALANCER\", \"MYSQL_DB_SYSTEM\", \"NETWORK_LOAD_BALANCER\", \"OBJECT_STORAGE_BUCKET\", \"OKE_CLUSTER\", \"VOLUME_GROUP\""
  }
}

