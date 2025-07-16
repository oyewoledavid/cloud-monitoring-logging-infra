[monitoring]
${monitoring_server_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/monitoring-key web_server_private_ip=${web_server_private_ip}

[web]
${web_server_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/monitoring-key monitoring_private_ip=${monitoring_private_ip}
