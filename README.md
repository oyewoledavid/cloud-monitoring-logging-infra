# 🌐 Cloud Monitoring & Logging Infrastructure on AWS

This project implements a real-world, production-grade cloud monitoring and logging infrastructure using **Terraform**, **Ansible**, **Prometheus**, **Grafana**, **Loki**, **Fluent Bit**, and **Alertmanager** ,all deployed on AWS.

> 🚀 **Fully automated with Infrastructure as Code** for easy provisioning, configuration, observability, and alerting.

---

## 📸 Overview

This infrastructure enables:

- ✅ Provisioning of EC2 instances and S3 buckets using **Terraform**
- ✅ Automated server configuration with **Ansible**
- ✅ Metrics collection using **Prometheus**
- ✅ Real-time visualization via **Grafana**
- ✅ Centralized log aggregation with **Fluent Bit** + **Loki**
- ✅ Slack notifications via **Alertmanager**
- ✅ Nginx reverse proxy + SSL for secure web access

---

## 🛠️ Tech Stack

| Tool           | Purpose                          |
|----------------|----------------------------------|
| **Terraform**  | Infrastructure provisioning      |
| **Ansible**    | Server configuration automation  |
| **Prometheus** | Metrics collection               |
| **Grafana**    | Monitoring dashboards            |
| **Loki**       | Log aggregation backend          |
| **Fluent Bit** | Lightweight log shipper          |
| **Alertmanager** | Routing and sending alerts     |
| **Node Exporter** | Export system-level metrics   |
| **Nginx + SSL** | Secure reverse proxy for UIs    |
| **AWS S3**     | Remote storage for Loki logs     |

---

## 🗂️ Project Structure

```text
cloud-monitoring-logging-infra/
├── terraform/                # Terraform infrastructure code
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── ansible/                  # Ansible automation code
│   ├── playbook.yml
│   │ 
│   ├── terraform_outputs.yml
│   └── roles/
│       ├── prometheus/
│       ├── grafana/
│       ├── alertmanager/
│       ├── loki/
│       ├── fluentbit/
│       ├── fluentbit_web/
│       ├── node_exporter/
│       ├── webserver/
│       └── reverse_nginx/
│
├── scripts/
│   └── generate_tf_outputs.py   # Script to convert Terraform outputs to Ansible vars
│
├── README.md
└── .gitignore
``` 

✅ Completed Features

- ✅ Infrastructure provisioning via Terraform
- ✅ Centralized logging with Fluent Bit and Loki
- ✅ Log storage in AWS S3
- ✅ Metrics collection with Prometheus + Node Exporter
- ✅ Dashboard visualizations in Grafana
- ✅ Slack alerting with Alertmanager
- ✅ Nginx reverse proxy for HTTPS access
- ✅ Fully automated setup with Ansible


🚀 Getting Started

1.  Clone the repo:
```bash
git clone https://github.com/your-username/cloud-monitoring-logging-infra.git
cd cloud-monitoring-logging-infra
```
2.  Provision Infrastructure:
```bash
cd terraform
terraform init
terraform apply
```
3.  Generate Terraform Outputs for Ansible:
```bash
cd ../ansible/scripts
python3 generate_tf_outputs.py
```
4.  Run Ansible Playbook:
```bash
cd ..
ansible-playbook -i inventory.ini playbook.yml
```

📊 Dashboards
Grafana is accessible at:
```arduino
https://your-domain.com/grafana/
```
Explore dashboards for:

    🖥️ System metrics (CPU, Memory, Disk)

    📦 Docker/container logs

    🧾 Application logs filtered by severity

    ⚠️ Triggered alerts

📣 Alerts

Slack alerts are configured via Alertmanager. Alerts include:

-  Instance down
-  High memory usage
-  Log-level based errors
-  Fluent Bit or Loki not pushing data

Make sure your Slack webhook is correctly configured in Ansible variables.

