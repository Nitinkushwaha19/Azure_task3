output "traffic_manager_fqdn" {
  value       = module.TM.TM_Profile.TM_FQDN
  description = "The fully qualified domain name (FQDN) of the Traffic Manager profile."
}
