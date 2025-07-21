#!/usr/bin/env python3
import json, yaml, subprocess, os

# Run terraform output -json
tf_output = subprocess.run(
    ["terraform", "output", "-json"],
    cwd="../../terraform",  # Adjust path to your Terraform directory
    capture_output=True,
    check=True
)

# Load JSON
outputs = json.loads(tf_output.stdout)

# Write to YAML

dest_path = "../terraform_outputs.yml"
os.makedirs(os.path.dirname(dest_path), exist_ok=True)

with open(dest_path, "w") as f:
    yaml.dump(outputs, f)


print("✅ Ansible variables generated successfully at ansible/terraform_outputs.yml")
