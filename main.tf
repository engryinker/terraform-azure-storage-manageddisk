data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "managed_disk" {
  source   = "Azure/avm-res-compute-disk/azurerm"
  version  = "0.4.1"
  for_each = var.managed_disks

  name                                    = each.value.name
  location                                = var.location
  resource_group_name                     = var.resource_group_name
  tags                                    = coalesce(each.value.tags, var.tags)
  enable_telemetry                        = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  tier                                    = each.value.tier
  disk_access_id                          = each.value.disk_access_id
  hyper_v_generation                      = each.value.hyper_v_generation
  zone                                    = each.value.zone
  disk_mbps_read_write                    = each.value.disk_mbps_read_write
  disk_size_gb                            = each.value.disk_size_gb
  logical_sector_size                     = each.value.logical_sector_size
  disk_iops_read_write                    = each.value.disk_iops_read_write
  disk_mbps_read_only                     = each.value.disk_mbps_read_only
  os_type                                 = each.value.os_type
  performance_plus_enabled                = each.value.performance_plus_enabled
  secure_vm_disk_encryption_set_id        = each.value.secure_vm_disk_encryption_set_id
  source_resource_id                      = each.value.source_resource_id
  customer_managed_key                    = each.value.customer_managed_key
  edge_zone                               = each.value.edge_zone
  gallery_image_reference_id              = each.value.gallery_image_reference_id
  network_access_policy                   = each.value.network_access_policy
  on_demand_bursting_enabled              = each.value.on_demand_bursting_enabled
  private_endpoints                       = each.value.private_endpoints
  role_assignments                        = each.value.role_assignments
  security_type                           = each.value.security_type
  create_option                           = each.value.create_option
  disk_iops_read_only                     = each.value.disk_iops_read_only
  encryption_settings                     = each.value.encryption_settings
  image_reference_id                      = each.value.image_reference_id
  source_uri                              = each.value.source_uri
  upload_size_bytes                       = each.value.upload_size_bytes
  storage_account_type                    = each.value.storage_account_type
  optimized_frequent_attach_enabled       = each.value.optimized_frequent_attach_enabled
  storage_account_id                      = each.value.storage_account_id
  trusted_launch_enabled                  = each.value.trusted_launch_enabled
  lock                                    = each.value.lock
  public_network_access_enabled           = each.value.public_network_access_enabled
  disk_encryption_set_id                  = each.value.disk_encryption_set_id
  max_shares                              = each.value.max_shares
  private_endpoints_manage_dns_zone_group = each.value.private_endpoints_manage_dns_zone_group
}
