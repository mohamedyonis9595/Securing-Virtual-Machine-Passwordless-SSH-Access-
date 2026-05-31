#!/bin/bash
# Azure VM Deployment Script - Nautilus DevOps Portfolio

RESOURCE_GROUP="kml_rg_main-9d8f96bdaeec4a57"
VM_NAME="xfusion-vm"
LOCATION="westus"
VM_SIZE="Standard_B1s"
DISK_SIZE_GB=30
STORAGE_SKU="Standard_LRS"
ADMIN_USER="azureuser"

echo "🚀 Starting deployment of ${VM_NAME} in Resource Group ${RESOURCE_GROUP}..."

# Create the VM with policy-compliant storage types
az vm create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --location "$LOCATION" \
  --image Ubuntu2204 \
  --size "$VM_SIZE" \
  --admin-username "$ADMIN_USER" \
  --ssh-key-values ~/.ssh/id_rsa.pub \
  --os-disk-size-gb "$DISK_SIZE_GB" \
  --storage-sku "$STORAGE_SKU" \
  --public-ip-sku Standard

echo "✅ Deployment complete! Fetching Public IP Address..."
az vm list-ip-addresses --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" \
  --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv

 Connect via SSH
echo "Connecting to the VM..."
ssh azureuser@$PUBLIC_IP
