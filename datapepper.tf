resource "oci_opensearch_opensearch_cluster_pipeline" "datapepper_pipeline" {
  depends_on = [oci_opensearch_opensearch_cluster.opensearch_cluster,oci_vault_secret.opensearch_endpoint,oci_vault_secret.opensearch_creds]

  compartment_id = var.compartment_ocid
  display_name = "DataPrepperPipeline"
  pipeline_configuration_body = file("config/pipeline_config.json")
  data_prepper_configuration_body = file("config/data_prepper_config.json")

  node_count = var.data_prepper_node_count
  ocpu_count = var.data_prepper_node_host_ocpu_count
  memory_gb = var.data_prepper_node_host_memory_gb
}
