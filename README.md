# Secure Azure VM Provisioning Architecture

This repository documents the automation and deployment configurations used to provision a secure, policy-compliant Ubuntu Linux Virtual Machine inside the Azure Cloud environment. The setup utilizes password-less SSH infrastructure vectors configured from a centralized jump host client.

## ⚙️ Architecture & Compliance Requirements

The infrastructure layout was deployed under strict enterprise governance rules:
* **Region Constraint:** `westus`
* **Compute Profiling:** `Standard_B1s`
* **Storage Footprint:** Exactly `30 GB` Local OS Storage Allocation
* **Storage SKU Policy:** Non-Premium standard tiered baseline HDD (`Standard_LRS`)
* **Access Vector:** Hardened asymmetric SSH Key authentication paired with the `azureuser` admin identity.

---

## 🛠️ Deployment Workflow Execution

### 1. SSH Cryptographic Key Generation
Validated the structural presence of local keys on the `azure-client` control node. If not present, generated an RSA 2048-bit keypair:
```bash
ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
