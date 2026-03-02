resource "oci_opensearch_opensearch_cluster" "opensearch_cluster" {
  compartment_id = var.compartment_ocid
  display_name   = var.opensearch_cluster_name
  software_version = var.opensearch_software_version

  master_node_count = var.master_node_count
  master_node_host_type = "FLEX"
  master_node_host_ocpu_count = var.master_node_host_ocpu_count
  master_node_host_memory_gb = var.master_node_host_memory_gb

  data_node_count = var.data_node_count
  data_node_host_type = "FLEX"
  data_node_host_ocpu_count = var.data_node_host_ocpu_count
  data_node_host_memory_gb = var.data_node_host_memory_gb
  data_node_storage_gb = 2730

  opendashboard_node_count = var.opensearch_dashboards_node_count
  opendashboard_node_host_ocpu_count = var.opensearch_dashboards_node_host_ocpu_count
  opendashboard_node_host_memory_gb = var.opensearch_dashboards_node_host_memory_gb

  vcn_compartment_id = var.network_compartment_ocid
  vcn_id = var.vcn_ocid
  subnet_compartment_id = var.network_compartment_ocid
  subnet_id = var.subnet_ocid
}
