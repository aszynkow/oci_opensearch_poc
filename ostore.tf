resource "oci_objectstorage_bucket" "buckets" {
  for_each = toset(var.bucket_names)

  compartment_id = var.compartment_ocid
  name           = each.value
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  storage_tier   = "Standard"
}

data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_ocid
}