# terraform-azure-storage-manageddisk

Org-standard Terraform wrapper for: **managed disks**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "storage-manageddisk" {
  source = "git::https://github.com/engryinker/terraform-azure-storage-manageddisk.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  managed_disks = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `managed_disks` (managed disks)

Wraps [Azure/avm-res-compute-disk/azurerm](https://registry.terraform.io/modules/Azure/avm-res-compute-disk/azurerm/0.4.1) v0.4.1.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `tier` | `string` | no |  |
| `disk_access_id` | `string` | no |  |
| `hyper_v_generation` | `string` | no |  |
| `zone` | `string` | yes |  |
| `disk_mbps_read_write` | `number` | no |  |
| `disk_size_gb` | `number` | no |  |
| `logical_sector_size` | `number` | no |  |
| `disk_iops_read_write` | `number` | no |  |
| `disk_mbps_read_only` | `number` | no |  |
| `os_type` | `string` | no |  |
| `performance_plus_enabled` | `bool` | no |  |
| `secure_vm_disk_encryption_set_id` | `string` | no |  |
| `source_resource_id` | `string` | no |  |
| `customer_managed_key` | `any` | no |  |
| `edge_zone` | `string` | no |  |
| `gallery_image_reference_id` | `string` | no |  |
| `network_access_policy` | `string` | no |  |
| `on_demand_bursting_enabled` | `bool` | no |  |
| `private_endpoints` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `security_type` | `string` | no |  |
| `create_option` | `string` | yes |  |
| `disk_iops_read_only` | `number` | no |  |
| `encryption_settings` | `any` | no |  |
| `image_reference_id` | `string` | no |  |
| `source_uri` | `string` | no |  |
| `upload_size_bytes` | `number` | no |  |
| `storage_account_type` | `string` | yes |  |
| `optimized_frequent_attach_enabled` | `bool` | no |  |
| `storage_account_id` | `string` | no |  |
| `trusted_launch_enabled` | `bool` | no |  |
| `lock` | `any` | no |  |
| `public_network_access_enabled` | `bool` | no |  |
| `disk_encryption_set_id` | `string` | no |  |
| `max_shares` | `number` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `managed_disks` -- map (same keys as the input) of every output from each created managed disks.
