variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "managed_disks" {
  description = "Map of managed disks to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-compute-disk/azurerm v0.4.1 (https://registry.terraform.io/modules/Azure/avm-res-compute-disk/azurerm/0.4.1) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                    = string
    tags                                    = optional(map(string))
    enable_telemetry                        = optional(bool)
    tier                                    = optional(string, null)
    disk_access_id                          = optional(string, null)
    hyper_v_generation                      = optional(string, null)
    zone                                    = string
    disk_mbps_read_write                    = optional(number, null)
    disk_size_gb                            = optional(number, null)
    logical_sector_size                     = optional(number, null)
    disk_iops_read_write                    = optional(number, null)
    disk_mbps_read_only                     = optional(number, null)
    os_type                                 = optional(string, null)
    performance_plus_enabled                = optional(bool, null)
    secure_vm_disk_encryption_set_id        = optional(string, null)
    source_resource_id                      = optional(string, null)
    customer_managed_key                    = optional(any, null)
    edge_zone                               = optional(string, null)
    gallery_image_reference_id              = optional(string, null)
    network_access_policy                   = optional(string, null)
    on_demand_bursting_enabled              = optional(bool, null)
    private_endpoints                       = optional(any, null)
    role_assignments                        = optional(any, null)
    security_type                           = optional(string, null)
    create_option                           = string
    disk_iops_read_only                     = optional(number, null)
    encryption_settings                     = optional(any, null)
    image_reference_id                      = optional(string, null)
    source_uri                              = optional(string, null)
    upload_size_bytes                       = optional(number, null)
    storage_account_type                    = string
    optimized_frequent_attach_enabled       = optional(bool, null)
    storage_account_id                      = optional(string, null)
    trusted_launch_enabled                  = optional(bool, null)
    lock                                    = optional(any, null)
    public_network_access_enabled           = optional(bool, null)
    disk_encryption_set_id                  = optional(string, null)
    max_shares                              = optional(number, null)
    private_endpoints_manage_dns_zone_group = optional(bool, null)
  }))
  default = {}
}
