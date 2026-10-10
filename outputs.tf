output "managed_disks" {
  description = "Map (same keys as var.managed_disks) of every output from each managed disks created -- see upstream module docs for the full shape."
  value       = module.managed_disk
}
