# AI Terraform Multi-Environment Repository

This repository contains Terraform configurations for managing AWS infrastructure across multiple environments (dev and prod).

## Structure

```
├── modules/
│   └── s3-bucket/          # Reusable S3 bucket module
├── environments/
│   ├── dev/                # Development environment
│   └── prod/               # Production environment
└── README.md
```

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- An S3 bucket for storing Terraform state (optional but recommended)

## Getting Started

### Development Environment

1. Navigate to the dev environment:
   ```bash
   cd environments/dev
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan your deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

### Production Environment

1. Navigate to the prod environment:
   ```bash
   cd environments/prod
   ```

2. Follow the same steps as dev environment

## Features

- **Multi-environment setup** with separate state files
- **S3 bucket module** with security best practices:
  - Versioning enabled
  - Server-side encryption
  - Public access blocked
- **Mandatory tagging** based on organizational standards:
  - `DeploymentType`: terraform
  - `Environment`: dev/prod
- **Region**: us-east-1

## Module Usage

The S3 bucket module can be reused across environments and accepts:
- `bucket_name`: Name of the S3 bucket
- `versioning_enabled`: Enable/disable versioning (default: true)
- `common_tags`: Map of tags to apply to resources

## Local Testing with LocalStack

For local development and testing, use LocalStack:

1. **Start LocalStack:**
   ```bash
   make localstack-up
   ```

2. **Test the local environment:**
   ```bash
   make test-local
   ```

3. **View LocalStack logs:**
   ```bash
   make localstack-logs
   ```

4. **Stop LocalStack:**
   ```bash
   make localstack-down
   ```

5. **Clean local environment:**
   ```bash
   make clean-local
   ```

## Configuration

Update the S3 backend configuration in each environment's `main.tf` if you want to use remote state storage.