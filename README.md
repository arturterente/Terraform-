## AWS IaC with Terraform

This project provisions a production-ready AWS network topology and compute instances using Terraform. The architecture includes a custom VPC with public and private subnets, an Internet Gateway for public traffic, a NAT Gateway tied to an Elastic IP for outbound private access, and dedicated EC2 instances.

## Architecture Overview (step by step)

1. Created VPC (10.0.0.0/16 CIDR block);
2. Created internet gateway **and attached it to VPC**;
3. Provisioned two public and two private subnets **inside the VPC**;
4. Launched one EC2 instance **into each subnet**;
5. Associated public IP address to the instances inside **public subnets**;
6. Allocated Elastic IP (EIP);
7. Created NAT Gateway **inside a public subnet** and assigned EIP to it;
8. Created two route tables:
   - Public (0.0.0.0/0 CIDR block) directing to the Internet Gateway
   - Private (0.0.0.0/0 CIDR block) directing to the NAT Gateway
9. Associated public route table with public subnets and private route table with private subnets

## Other files 

- I created _variables.tf_ file and assigned hardcoded values to variables for more flexibility
- I created _outputs.tf_ file to output the region when **$terraform apply** is used
