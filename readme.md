# > Terraform v1.7.5


az ad sp create-for-rbac --name terraform_cloud_devops-kreft --role Contributor --scopes /subscriptions/87f28a4d-08ed-49ea-a432-a07656c1ac9d
-> Create serviceaccont for the "terraform cloud" to create resources inside Azure on subscriptions MSDN/ MPN aka 87f28a4d-08ed-49ea-a432-a07656c1ac9d



# https://learn.microsoft.com/en-us/azure/developer/terraform/best-practices-testing-overview
# https://learn.microsoft.com/en-us/azure/developer/terraform/best-practices-compliance-testing
# https://learn.microsoft.com/en-us/azure/developer/terraform/best-practices-end-to-end-testing


# Terraform Test requires version Terraform v1.6.0 ++ and  az CLI installed on PC


https://www.pimwiddershoven.nl/entry/hugo-static-website-on-azure-static-web-app-terraform/


https://learn.microsoft.com/en-us/security/benchmark/azure/mcsb-devops-security
https://learn.microsoft.com/en-us/security/benchmark/azure/baselines/app-service-security-baseline





Microsoft Defender for Cloud monitoring
Azure Policy built-in definitions - Microsoft.Web:

Name
(Azure portal)	Description	Effect(s)	Version
(GitHub)
App Service apps should use managed identity	Use a managed identity for enhanced authentication security	AuditIfNotExists, Disabled	3.0.0


IM-8: Restrict the exposure of credential and secrets
Features
Service Credential and Secrets Support Integration and Storage in Azure Key Vault
Description: Data plane supports native use of Azure Key Vault for credential and secrets store. Learn more.

Supported	Enabled By Default	Configuration Responsibility
True	False	Customer