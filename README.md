🚀 Azure Tenant-to-Tenant Secure Data Migration using Terraform

This project demonstrates a real-world Azure-based secure data migration between two tenants using Infrastructure as Code (Terraform) along with secure networking and access control mechanisms.

📌 Project Overview

In this implementation, two separate Azure tenants were configured with storage accounts, and a secure data migration pipeline was established using Azure Private Endpoint, SAS authentication, and AzCopy.

The focus of this project is to simulate enterprise-grade cross-tenant data migration with security-first architecture.

🏗️ Architecture Components
Azure Storage Account (Source - Tenant A)
Azure Storage Account (Destination - Tenant B)
Private Endpoint (Secure network access)
Virtual Network + Subnet
SAS (Shared Access Signature) authentication
Client IP restriction via firewall rules
AzCopy for data transfer
🔐 Security Implementation
Private Endpoint ensures traffic remains within Azure backbone network
SAS tokens provide time-bound and permission-based access control
IP-based firewall rules restrict unauthorized access
Public access is disabled to enforce secure connectivity
⚙️ Infrastructure as Code

All infrastructure is provisioned using Terraform, ensuring:

Repeatability
Scalability
Version control
Automated deployment
📂 Repository Structure
terraform/   → Core IaC code
docs/        → Architecture diagram + migration notes
README.md    → Project documentation
📊 Key Learnings
Cross-tenant storage migration architecture
Secure access design using Private Endpoint
Practical understanding of SAS token structure and usage
Terraform-based infrastructure provisioning
Real-world Azure networking concepts (VNet, DNS, Private Link)
