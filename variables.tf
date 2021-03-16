variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "key_vault_name" {
  description = "The Name of the key vault"
  default     = ""
}

variable "key_vault_sku_pricing_tier" {
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}

variable "enabled_for_deployment" {
  description = "Allow Virtual Machines to retrieve certificates stored as secrets from the key vault."
  default     = true
}

variable "enabled_for_disk_encryption" {
  description = "Allow Disk Encryption to retrieve secrets from the vault and unwrap keys."
  default     = true
}

variable "enabled_for_template_deployment" {
  description = "Allow Resource Manager to retrieve secrets from the key vault."
  default     = true
}

variable "enable_soft_delete" {
  description = " Should Soft Delete be enabled for this Key Vault?"
  default     = true
}

variable "enable_purge_protection" {
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = false
}

variable "access_policies" {
  description = "List of access policies for the Key Vault."
  default     = []
}

variable "network_acls" {
  description = "Network rules to apply to key vault."
  type        = object({ bypass = string, default_action = string, ip_rules = list(string), virtual_network_subnet_ids = list(string) })
  default     = null
}

variable "secrets" {
  type        = map(string)
  description = "A map of secrets for the Key Vault."
  default     = {}
}

variable "keys" {
  type        = map(string)
  description = "A map of keys for the Key Vault."
  default     = {}
}

variable "key_type" {
  type        = string
  default     = "RSA"
  description = "Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, Oct (Octet), RSA and RSA-HSM. Changing this forces a new resource to be created."
}

variable "log_analytics_workspace_id" {
  description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent"
  default     = null
}

variable "azure_monitor_logs_retention_in_days" {
  description = "The Azure Monitoring data retention in days."
  default     = 30
}

variable "storage_account_id" {
  description = "The name of the storage account to store the all monitoring logs"
  default     = null
}

variable "policies" {
  type = map(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}



##variable "principal" {
##  description = ""
##  default     = ""
##}

#variable "folder_list" {
#  description = "List of folder to create"
#  type        = list(object({ name = string }))
#  default     = []
#}