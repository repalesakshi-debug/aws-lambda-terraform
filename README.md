# AWS Lambda Deployment Using Terraform Modules

**Infrastructure as Code | AWS Serverless | Modular Terraform | Python**

## Overview

This project provisions and deploys an AWS Lambda function using Terraform with a modular infrastructure design. It separates IAM configuration, Lambda deployment, and environment-specific settings to improve maintainability, reusability, and scalability.

The Lambda function is written in Python and integrated with Amazon CloudWatch Logs for execution monitoring.

## Architecture

```text
Developer
    |
    v
Terraform
    |
    v
Environment Configuration
(environments/dev)
    |
    +---------------------+
    |                     |
    v                     v
IAM Module           Lambda Module
    |                     |
    v                     v
IAM Execution Role   Python Lambda Function
                          |
                          v
                    CloudWatch Logs
```

## Technology Stack

| Technology | Purpose |
|---|---|
| AWS Lambda | Serverless compute |
| AWS IAM | Execution role and permissions |
| Amazon CloudWatch Logs | Logging and monitoring |
| Terraform | Infrastructure provisioning |
| Python | Lambda function implementation |
| AWS CLI | Deployment verification and testing |
| Git & GitHub | Version control and documentation |

## Project Structure

```text
aws-lambda-terraform/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars
├── modules/
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── lambda/
│   └── app.py
├── .gitignore
└── README.md
```

## Key Implementation Details

- **Modular architecture:** Separates IAM and Lambda resources into reusable modules.
- **IAM execution role:** Allows Lambda to assume its execution role.
- **Least-purpose permissions:** Attaches the AWS-managed `AWSLambdaBasicExecutionRole` policy for CloudWatch logging. This policy grants basic log-writing permissions; it is not a complete least-privilege policy for every possible function.
- **Automated packaging:** Terraform packages the Python handler into a ZIP file.
- **CloudWatch integration:** Creates a dedicated log group with a seven-day retention period.
- **Configuration management:** Uses variables, outputs, and resource tags.
- **Environment separation:** Keeps development configuration separate from reusable modules.

## Deployment

### Prerequisites

- AWS account with appropriate IAM permissions
- Terraform CLI
- AWS CLI configured with credentials
- Git

### 1. Clone the repository

```bash
git clone https://github.com/YOUR-USERNAME/aws-lambda-terraform.git
cd aws-lambda-terraform
```

Replace `YOUR-USERNAME` with your GitHub username.

### 2. Verify AWS credentials

```bash
aws sts get-caller-identity
```

### 3. Initialize Terraform

```bash
cd environments/dev
terraform init
```

### 4. Format and validate

```bash
terraform fmt -recursive
terraform validate
```

### 5. Review the execution plan

```bash
terraform plan
```

### 6. Deploy the infrastructure

```bash
terraform apply
```

Review the plan and confirm the deployment when prompted.

## Function Testing

Invoke the deployed Lambda function using AWS CLI:

```powershell
aws lambda invoke `
  --function-name aws-lambda-dev-function `
  --region eu-west-3 `
  --cli-binary-format raw-in-base64-out `
  --payload '{}' `
  response.json
```

Inspect the response:

```powershell
Get-Content .\response.json
```

The expected response contains the message `Hello from AWS Lambda!` and a successful status.

## Monitoring

Retrieve recent function logs:

```powershell
aws logs tail /aws/lambda/aws-lambda-dev-function `
  --region eu-west-3 `
  --since 10m
```

## Terraform Outputs

The configuration exposes:

- Lambda function name
- Lambda function ARN
- IAM execution role ARN
- CloudWatch log group name

Retrieve the outputs with:

```bash
terraform output
```

## Cleanup

To remove the infrastructure created by this project:

```bash
terraform destroy
```

Review the proposed changes before confirming.

**Cost consideration:** AWS Lambda, CloudWatch Logs, and related AWS services may incur charges depending on usage and applicable free-tier eligibility.

## Skills Demonstrated

- Infrastructure as Code with Terraform
- Reusable Terraform module design
- AWS IAM roles and permissions
- Python-based serverless deployment
- Lambda ZIP packaging
- CloudWatch logging and monitoring
- AWS CLI verification
- Git-based version control

## Author

**Sakshi Repale**  
Aspiring AWS & DevOps Engineer

