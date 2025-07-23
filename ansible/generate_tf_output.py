#!/usr/bin/env python3
import json, yaml, subprocess, os

# Run `terraform output -json`
tf_output = subprocess.run(
    ["terraform", "output", "-json"],
    cwd="../../terraform",  # Adjust path to your Terraform folder
    capture_output=True,
    check=True
)

# Load the JSON output
raw_outputs = json.loads(tf_output.stdout)

# Flatten to key: value
flattened_outputs = {key: val["value"] for key, val in raw_outputs.items()}

# Write to YAML
dest_path = "../terraform_outputs.yml"
os.makedirs(os.path.dirname(dest_path), exist_ok=True)

with open(dest_path, "w") as f:
    yaml.dump(flattened_outputs, f)

print("✅ Flattened Terraform outputs written to terraform_outputs.yml")
