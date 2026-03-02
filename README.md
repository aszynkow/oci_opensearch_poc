# OpenSearch Cluster with Data Pepper and Streaming

This Terraform configuration deploys a comprehensive OpenSearch analytics stack on Oracle Cloud Infrastructure (OCI), including data ingestion pipelines and streaming capabilities.

## Architecture Overview

The stack includes:

- **OpenSearch Cluster**: Scalable search and analytics engine with configurable data, master, and dashboard nodes
- **Data Pepper Pipeline**: Data ingestion and processing pipeline for transforming and routing data to OpenSearch
- **Object Storage Buckets**: Cloud storage for data persistence and backups
- **Streaming Service**: Kafka-compatible streaming platform with private endpoints for real-time data processing
- **Vault Secrets**: Secure credential management for OpenSearch authentication
- **KMS Encryption**: Key management for data security

## Features

- **Scalable Architecture**: Configurable node counts and instance types for different workloads
- **Data Ingestion**: HTTP-based data ingestion with authentication and processing pipelines
- **Real-time Streaming**: Kafka-compatible streaming with private networking
- **Secure Access**: Vault-based secret management and KMS encryption
- **Private Networking**: All components deployed in private subnets with secure access

## Prerequisites

- OCI account with appropriate permissions
- Terraform 1.0+
- OCI CLI configured
- Sufficient service limits for:
  - OpenSearch clusters
  - Streaming partitions
  - KMS vaults
  - Object storage buckets

## Quick Deploy

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/aszynkow/oci_opensearch_poc/raw/main/rm/version1.0/opensearch-stack.zip)

## Manual Deployment

### 1. Clone and Prepare

```bash
# Download the terraform configuration
unzip opensearch-stack.zip
cd opensearch

# Configure environment variables
cp source_env.sh.example source_env.sh
# Edit source_env.sh with your OCI credentials and configuration
```

### 2. Configure Variables

Edit `source_env.sh` with your OCI environment details:

```bash
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..your_compartment_ocid"
export TF_VAR_network_compartment_ocid="ocid1.compartment.oc1..your_network_compartment"
export TF_VAR_vcn_ocid="ocid1.vcn.oc1..your_vcn_ocid"
export TF_VAR_subnet_ocid="ocid1.subnet.oc1..your_subnet_ocid"
export TF_VAR_opensearch_password="your_secure_password"
# ... other variables as needed
```

### 3. Initialize and Plan

```bash
# Source environment variables
source source_env.sh

# Initialize Terraform
terraform init

# Review the deployment plan
terraform plan
```

### 4. Deploy

```bash
# Apply the configuration
terraform apply

# Or apply automatically
terraform apply --auto-approve
```

### 5. Access OpenSearch

After deployment, access the OpenSearch cluster:

- **OpenSearch Dashboard**: `https://<cluster-fqdn>/`
- **API Endpoint**: `https://<cluster-fqdn>:9200`
- **Data Pepper Pipeline**: Automatically configured for data ingestion

## Configuration Options

### OpenSearch Cluster
- **Data Nodes**: Configurable count, OCPUs, and memory
- **Master Nodes**: Dedicated master nodes for cluster management
- **Dashboard Nodes**: OpenSearch Dashboards for visualization

### Data Pepper
- **Pipeline Configuration**: HTTP ingestion with authentication
- **Data Processing**: Grok pattern matching and transformation
- **Buffering**: Persistent buffering for reliability

### Streaming
- **Private Endpoints**: Secure access within VCN
- **Kafka Compatibility**: Standard Kafka producer/consumer APIs
- **Auto-scaling**: Dynamic partition management

## Security Considerations

- All components deployed in private subnets
- Vault-based secret management
- KMS encryption for sensitive data
- Network security groups for access control

## Monitoring and Maintenance

- Cloud monitoring integration
- Automated backups to Object Storage
- Scaling based on workload requirements

## Troubleshooting

### Common Issues

1. **Service Limits**: Ensure sufficient OCI service limits for all components
2. **Network Configuration**: Verify VCN and subnet configurations
3. **Authentication**: Check OCI credentials and permissions

### Logs and Debugging

```bash
# View Terraform logs
terraform apply -debug

# Check OpenSearch cluster status
oci opensearch cluster get --cluster-id <cluster-ocid>
```

## Support

For issues and questions:
- Check OCI documentation for service-specific guidance
- Review Terraform logs for deployment issues
- Verify service limits in OCI Console

## Cost Estimation

The stack cost depends on:
- Number and size of OpenSearch nodes
- Data storage requirements
- Streaming throughput
- Object storage usage

Use OCI Cost Estimator for detailed pricing.