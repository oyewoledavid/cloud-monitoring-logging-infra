#!/bin/bash

cd terraform
terraform apply -auto-approve
terraform output -json > ansible/terraform_outputs.yml
cd ../ansible/scripts/
python3 generate_ansible_tf_vars.py
cd ../../ansible/
ansible-playbook -i inventory.ini playbook.yml
