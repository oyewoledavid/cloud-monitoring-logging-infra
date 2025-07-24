#!/bin/bash

set -e  # Exit if any command fails
set -o pipefail

# 1️⃣ CONFIGURATION
DOMAIN_NAME="blessedc.org"               # Your domain
SUBDOMAIN="monitoring"                   # The A record to update
DDNS_PASSWORD="91630bf13693438fb54cf1e9a1d20709" # Replace this with your DDNS password from Namecheap

TERRAFORM_DIR="./terraform"
ANSIBLE_DIR="../ansible"

echo "🚀 Starting Infrastructure Deployment..."

# 2️⃣ TERRAFORM APPLY
cd "$TERRAFORM_DIR"
echo "🧱 Running Terraform..."
terraform init
terraform apply -auto-approve

# 3️⃣ GET MONITORING SERVER PUBLIC IP
echo "🌐 Getting Monitoring Server Public IP..."
PUBLIC_IP=$(terraform output -raw monitoring_ip)
echo "✅ Monitoring server public IP: $PUBLIC_IP"

# 4️⃣ UPDATE NAMECHEAP DYNAMIC DNS
echo "🔁 Updating A record via Namecheap Dynamic DNS..."

curl -s "https://dynamicdns.park-your-domain.com/update?host=$SUBDOMAIN&domain=$DOMAIN_NAME&password=$DDNS_PASSWORD&ip=$PUBLIC_IP" | grep -q "<ErrCount>0</ErrCount>"

if [[ $? -eq 0 ]]; then
    echo "✅ DNS record updated successfully: $SUBDOMAIN.$DOMAIN_NAME → $PUBLIC_IP"
else
    echo "❌ Failed to update DNS record. Check your DDNS password and domain settings."
    exit 1
fi

# 5️⃣ OPTIONAL: Wait for DNS propagation (10–30s)
echo "⏳ Waiting for DNS propagation..."
sleep 60

# 6️⃣ RUN ANSIBLE
cd "$ANSIBLE_DIR"
echo "🤖 Generating Ansible variables..."
python3 generate_tf_output.py
echo "🤖 Running Ansible playbook..."
ansible-playbook -i inventory.ini playbook.yml

echo "🎉 All done!"
