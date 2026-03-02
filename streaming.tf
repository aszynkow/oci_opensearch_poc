resource "oci_streaming_stream_pool" "stream_pool" {
  compartment_id = var.compartment_ocid
  name           = var.stream_pool_name
  private_endpoint_settings {
    subnet_id = var.streaming_subnet_ocid
  }
  kafka_settings {
    auto_create_topics_enable = true
    log_retention_hours       = 24
    num_partitions            = 1
  }
}

resource "oci_streaming_stream" "stream" {
  name           = var.stream_name
  partitions     = 1
  stream_pool_id = oci_streaming_stream_pool.stream_pool.id
}

resource "oci_streaming_connect_harness" "kafka_connector" {
  name           = var.kafka_connector_name
  compartment_id = var.compartment_ocid
}
