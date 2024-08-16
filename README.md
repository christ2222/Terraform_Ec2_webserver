

---

# Terraform AWS EC2 Web Server Setup

## Overview

This project leverages Terraform to provision and manage infrastructure on AWS. Specifically, it sets up an EC2 instance running an Apache web server. The web server hosts a custom HTML page with a purple background, displaying a statement about Terraform, with Terraform logos positioned in the top corners of the page.

## Key Features

- **Cloud Provider**: AWS
- **Instance Type**: t2.micro
- **Web Server**: Apache HTTP Server
- **Custom Web Page**: HTML page with Terraform logos and a descriptive statement about Terraform.
- **Key Pair**: Uses an existing key pair for SSH access.
- **Infrastructure as Code**: All resources are defined and managed through Terraform.

## Prerequisites

Before you begin, ensure you have the following:

- **Terraform** installed on your machine.
- **AWS CLI** installed and configured with appropriate credentials.
- An **existing key pair** in AWS to be used for SSH access to the EC2 instance.
- **Public key** (`.pem`) file of your key pair.
- An S3 bucket for storing Terraform state files (if using remote backend).
- The **Terraform script** provided in the `main.tf` file.

## Terraform Resources

This project creates the following AWS resources:

- **EC2 Instance**: A single t2.micro instance running in the specified region and subnet.
- **Apache Web Server**: The EC2 instance is configured with Apache, serving a custom HTML page.
- **Custom HTML Page**: The page displays information about Terraform and includes logos in the top corners.
- **User Data Script**: Automates the installation and configuration of the web server during instance launch.

## File Structure

- `main.tf`: The main Terraform configuration file containing the infrastructure definitions.

## How to Use

### Step 1: Initialize Terraform
Navigate to the directory containing `main.tf` and run:

```bash
terraform init
```

This command initializes the Terraform working directory and downloads the necessary provider plugins.

### Step 2: Review the Execution Plan

To see what Terraform will do before actually applying the changes, run:

```bash
terraform plan
```

This will show you a preview of the resources that Terraform will create or modify.

### Step 3: Apply the Configuration

To create the resources defined in `main.tf`, run:

```bash
terraform apply
```

You will be prompted to confirm the action. Type `yes` to proceed.

### Step 4: Access the Web Server

Once the EC2 instance is running, retrieve its public IP address from the AWS Management Console or by using Terraform outputs. Access the custom web page by navigating to:

```bash
http://<instance-public-ip>
```

You should see a purple background with a statement about Terraform and logos in the top corners.

### Step 5: Clean Up Resources

When you are done, you can destroy the resources created by Terraform to avoid unnecessary charges:

```bash
terraform destroy
```

## Customization

You can customize various aspects of this setup:

- **AMI ID**: Change the Amazon Machine Image (AMI) ID to match your preferred operating system.
- **Instance Type**: Adjust the `instance_type` parameter in the `aws_instance` resource to use a different EC2 instance type.
- **User Data Script**: Modify the user data script to install additional software or configure the instance further.
- **HTML Content**: Update the HTML content served by Apache to match your requirements.

## Troubleshooting

- **Instance Not Accessible**: Ensure your security groups allow inbound traffic on port 80 (HTTP) and SSH access if needed.
- **Terraform Errors**: Check the syntax in `main.tf` and ensure all variables and resource names are correct.

## License

This project is open-source and licensed under the MIT License.

---

This ReadMe file provides a clear and concise overview of your Terraform project, instructions for setting it up, and details on how to customize and manage the infrastructure.
