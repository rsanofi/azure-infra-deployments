# Azure Infrastructure Deployments

This repository contains Terraform code and a GitHub Actions pipeline for deploying and managing Azure infrastructure across multiple environments (`dev`, `prod`).

## Structure

```
├── main.tf                # Root Terraform configuration, module references
├── variables.tf         # Input variables for modules
├── provider.tf          # Provider and backend configuration
├── environments/
│   ├── dev/
│   │   ├── backend.config
│   │   └── dev.tfvars
│   └── prod/
│       ├── backend.config
│       └── prod.tfvars
└── .github/
    └── workflows/
        └── terraform.yml  # CI/CD pipeline for plan/apply
```

## GitHub Actions Pipeline

- **Terraform Plan**: Runs automatically for both `dev` and `prod` environments on push and pull request. Checks formatting, validates, and creates a plan for each environment.
- **Terraform Apply**: Must be triggered manually from the GitHub Actions UI. You select the environment (`dev` or `prod`) to apply the latest plan.
- **Azure Authentication**: Uses GitHub secrets for Azure credentials (`AZURE_CLIENT_ID`, `AZURE_CLIENT_SECRET`, `AZURE_SUBSCRIPTION_ID`, `AZURE_TENANT_ID`).

## Usage

1. **Configure GitHub Secrets**
   - Add the following secrets to your repository:
     - `AZURE_CLIENT_ID`
     - `AZURE_CLIENT_SECRET`
     - `AZURE_SUBSCRIPTION_ID`
     - `AZURE_TENANT_ID`

2. **Pipeline Triggers**
   - On push or pull request to `main`, the pipeline runs `terraform plan` for both environments.
   - To apply changes, go to the GitHub Actions tab, select the workflow, and click "Run workflow". Choose the environment to apply.

3. **Environment Files**
   - Each environment has its own `backend.config` and `tfvars` file under `environments/<env>/`.

## Modules

This repo uses remote modules for resource group, storage, and virtual network from [rsanofi/tf-modules](https://github.com/rsanofi/tf-modules).

## Requirements
- Terraform >= 1.7.5
- Azure Subscription

## License
MIT
