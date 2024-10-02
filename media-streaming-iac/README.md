```markdown
# Media Streaming Infrastructure as Code (IaC) with AWS

This project sets up a media streaming infrastructure using AWS services like S3, Lambda, API Gateway, and CloudFront. The infrastructure is provisioned using Terraform.

## Overview

This repository contains a Terraform configuration that deploys the following AWS resources:
- **S3 Bucket**: Stores the media content, configured for website hosting.
- **IAM Role**: A role for AWS Lambda execution.
- **Lambda Function**: Executes media-related functionality (deployed as `lambda_function.zip`).
- **API Gateway**: Exposes an API endpoint for media streaming.
- **CloudFront Distribution**: Provides a Content Delivery Network (CDN) for streaming media with HTTPS support.

### AWS Services Used:
- **S3**: For media storage and static website hosting.
- **Lambda**: For processing media requests.
- **API Gateway**: To expose an API for media streaming.
- **CloudFront**: To deliver media content with low latency.
- **IAM**: To provide necessary permissions for Lambda execution.

## Prerequisites

Before running the Terraform configuration, ensure you have the following:
- [Terraform](https://www.terraform.io/downloads) installed.
- An AWS account with appropriate permissions to create the resources.
- Your AWS credentials set up locally (e.g., using `aws configure`).
- Node.js runtime if you need to develop or modify the Lambda function.

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Nish1102/Solative_demo.git
cd Solative_demo/media-streaming-iac
```

### 2. Initialize Terraform
Initialize the Terraform workspace to download necessary providers and modules:
```bash
terraform init
```

### 3. Modify the Configuration (Optional)
If needed, modify the bucket name, region, or other parameters in the `main.tf` file before applying the configuration.

### 4. Apply the Configuration
To create the infrastructure, run:
```bash
terraform apply
```
This will prompt you to confirm. Type `yes` to proceed.

### 5. Lambda Deployment
Ensure that the Lambda function (`lambda_function.zip`) is located in the path specified in the Terraform file (`/home/nishant/Project/Solative/media-streaming-iac/lambda_function.zip`). The Lambda will be deployed with this ZIP file.

### 6. Clean Up
To tear down the infrastructure, run:
```bash
terraform destroy
```
This will prompt you to confirm the destruction of resources.

## Resource Breakdown

### S3 Bucket
- **Name**: `media-streaming-bucket-nishant-unique-2024`
- **Configuration**: Configured as a static website with public read access enabled.
- **Use**: Stores media files and serves them via CloudFront.

### IAM Role
- **Role Name**: `lambda_exec_role`
- **Permissions**: Attached with the `AWSLambdaBasicExecutionRole` to allow Lambda execution.

### Lambda Function
- **Function Name**: `MediaLambda`
- **Runtime**: Node.js 18.x
- **Handler**: `index.handler`
- **Role**: Associated with the IAM role for Lambda execution.
- **Source**: `lambda_function.zip`

### API Gateway
- **Name**: `Media API`
- **Description**: API Gateway exposing media streaming endpoints.

### CloudFront Distribution
- **Origin**: S3 bucket for media content.
- **Protocol**: Redirects all traffic to HTTPS for secure access.
- **Caching**: Configured for GET and HEAD requests.
- **Geo-Restrictions**: No geo-restrictions are applied.

## Customization

- **S3 Bucket Name**: Ensure the bucket name is globally unique. Modify the bucket name in `main.tf` if needed.
- **Lambda Code**: The Lambda function source code is expected to be in a ZIP file (`lambda_function.zip`). Modify the Lambda function code and re-zip it before deploying.

