# Configure the AWS provider
provider "aws" {
    region = "us-west-2"
}

# Retrieve an existing key pair
data "aws_key_pair" "existing_key" {
    key_name = "logotse_us_west_2_kp"    
}

# Create an EC2 instance 
resource "aws_instance" "Terraform_Ec2_Webserver" {
    ami           = "ami-07ad29071ea49df02"
    instance_type = "t2.micro"
    subnet_id     = "subnet-01d63b02aaee40c22"  # Replace with your subnet ID
    key_name      = data.aws_key_pair.existing_key.key_name
    
    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo '<html>
            <body style="background-color:purple;">
                <h1 style="color:white; text-align:center; padding-top:20%;">
                    Terraform is an open-source tool for provisioning and managing infrastructure as code. Developed by HashiCorp, Terraform is cloud-agnostic, enabling it to work seamlessly across various cloud providers. It utilizes a declarative programming approach, allowing users to define the desired state of their infrastructure. Terraform is highly expressive and extendable, meaning it can be integrated with a wide range of software through plugins, making it a versatile solution for infrastructure automation.
                </h1>
            </body>
          </html>' > /var/www/html/index.html
    EOF

    tags = {
        Name = "Terraform_Ec2_Webserver"
    }
}
