variable "compartment_ocid" {
  description = "OCID of the compartment where OpenSearch cluster and buckets will be created"
  type        = string
}

variable "network_compartment_ocid" {
  description = "OCID of the compartment containing the VCN and subnet"
  type        = string
}

variable "vcn_ocid" {
  description = "OCID of the VCN"
  type        = string
}

variable "subnet_ocid" {
  description = "OCID of the subnet"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
}

variable "tenancy_ocid" {
  description = "Tenancy OCID"
  type        = string
}

variable "user_ocid" {
  description = "User OCID"
  type        = string
  default = ""
}

variable "fingerprint" {
  description = "Fingerprint"
  type        = string
  default = ""
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
  default = ""
}

variable "opensearch_cluster_name" {
  description = "Name of the OpenSearch cluster"
  type        = string
  default     = "npe-db-opnsrch-004"
}

variable "opensearch_software_version" {
  description = "OpenSearch software version"
  type        = string
  default     = "2.11.0"
}

variable "master_node_count" {
  description = "Number of master nodes"
  type        = number
  default     = 2 #3
}

variable "master_node_host_ocpu_count" {
  description = "OCPU count for master nodes"
  type        = number
  default     = 4
}

variable "master_node_host_memory_gb" {
  description = "Memory in GB for master nodes"
  type        = number
  default     = 32
}

variable "data_node_count" {
  description = "Number of data nodes"
  type        = number
  default     = 6
}

variable "data_node_host_ocpu_count" {
  description = "OCPU count for data nodes"
  type        = number
  default     = 8
}

variable "data_node_host_memory_gb" {
  description = "Memory in GB for data nodes"
  type        = number
  default     = 64
}

variable "opensearch_dashboards_node_count" {
  description = "Number of dashboard nodes"
  type        = number
  default     = 1
}

variable "opensearch_dashboards_node_host_ocpu_count" {
  description = "OCPU count for dashboard nodes"
  type        = number
  default     = 4
}

variable "opensearch_dashboards_node_host_memory_gb" {
  description = "Memory in GB for dashboard nodes"
  type        = number
  default     = 16
}

variable "data_prepper_node_count" {
  description = "Number of Data Prepper nodes"
  type        = number
  default     = 2
}

variable "data_prepper_node_host_ocpu_count" {
  description = "OCPU count for Data Prepper nodes"
  type        = number
  default     = 2
}

variable "data_prepper_node_host_memory_gb" {
  description = "Memory in GB for Data Prepper nodes"
  type        = number
  default     = 64
}

variable "total_storage_gb" {
  description = "Total storage in GB"
  type        = number
  default     = 16384
}

variable "bucket_names" {
  description = "List of bucket names"
  type        = list(string)
  default     = ["npe-stor-objstor-004-0001", "npe-stor-objstor-004-0002"]
}

variable "stream_pool_name" {
  description = "Name of the streaming pool"
  type        = string
  default     = "npe-stream-pool-004"
}

variable "stream_name" {
  description = "Name of the streaming stream"
  type        = string
  default     = "npe-stream-004"
}

variable "kafka_connector_name" {
  description = "Name of the Kafka connector"
  type        = string
  default     = "npe-kafka-conn-004"
}

variable "streaming_subnet_ocid" {
  description = "OCID of the subnet for streaming private endpoint"
  type        = string
}

variable "security_master_user_name" {
  description = "Security master user name"
  type        = string
}

variable "security_master_user_password" {
  description = "Security master user password"
  type        = string
}
