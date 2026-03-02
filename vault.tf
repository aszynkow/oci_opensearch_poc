data "oci_opensearch_opensearch_cluster" "opensearch_cluster" {
  opensearch_cluster_id = oci_opensearch_opensearch_cluster.opensearch_cluster.id
}
resource "oci_kms_vault" "vault" {
  compartment_id = var.compartment_ocid
  display_name   = "OpenSearch Vault"
  vault_type     = "DEFAULT"
}

resource "oci_kms_key" "key" {
  compartment_id = var.compartment_ocid
  display_name   = "OpenSearch Key"
  key_shape {
    algorithm = "AES"
    length    = 32
  }
  management_endpoint = oci_kms_vault.vault.management_endpoint
}

resource "oci_vault_secret" "opensearch_creds" {
  compartment_id = var.compartment_ocid
  vault_id       = oci_kms_vault.vault.id
  key_id         = oci_kms_key.key.id
  description    = "OpenSearch credentials"
  secret_name    = "opensearch-creds"
  secret_content {
    content_type = "BASE64"
    content      = base64encode(jsonencode({
      username = "admin"
      password = var.opensearch_password
    }))
  }
}

resource "oci_vault_secret" "opensearch_endpoint" {
  depends_on = [data.oci_opensearch_opensearch_cluster.opensearch_cluster]
  compartment_id = var.compartment_ocid
  vault_id       = oci_kms_vault.vault.id
  key_id         = oci_kms_key.key.id
  description    = "OpenSearch endpoint"
  secret_name    = "opensearch-endpoint"
  secret_content {
    content_type = "BASE64"
    content      = base64encode("https://${data.oci_opensearch_opensearch_cluster.opensearch_cluster.opensearch_fqdn}:9200")
  }
}
