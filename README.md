# 🌐 Cloud Monitoring & Logging Infrastructure on AWS (Fully Automated)

This project implements a production-ready **cloud monitoring and logging stack** on AWS, combining **Terraform**, **Ansible**, **Prometheus**, **Grafana**, **Loki**, **Fluent Bit**, and **Alertmanager**.

> ✅ **Fully automated** end-to-end setup with a single `deploy.sh` script. From infrastructure provisioning to SSL-secured dashboards and Slack alerts—everything just works.

---

## 🔭 Overview

This infrastructure provides:

- ✅ EC2 and S3 provisioning via **Terraform**
- ✅ Dynamic DNS updates using **Namecheap API**
- ✅ Automated configuration with **Ansible**
- ✅ Metrics collection using **Prometheus + Node Exporter**
- ✅ Centralized logging via **Fluent Bit → Loki**
- ✅ Log storage in **AWS S3**
- ✅ Visualization with **Grafana**
- ✅ Slack alerting via **Alertmanager**
- ✅ HTTPS access via **Nginx reverse proxy + Certbot**

---

## 🧰 Tech Stack

| Tool           | Purpose                           |
|----------------|-----------------------------------|
| Terraform      | Infrastructure provisioning (EC2, S3) |
| Ansible        | Configuration automation across servers |
| Prometheus     | Metrics collection and alerting rules |
| Grafana        | Monitoring dashboards              |
| Loki           | Log aggregation backend (stored in S3) |
| Fluent Bit     | Lightweight log shipper            |
| Alertmanager   | Routing alerts to Slack            |
| Node Exporter  | System-level metrics exporter      |
| Nginx + Certbot| HTTPS reverse proxy with auto SSL  |
| AWS S3         | Remote log storage for Loki        |
| Namecheap DDNS | Automated A record creation        |

---

## 📦 Project Structure
```text
cloud-monitoring-logging-infra/
├── terraform/ # Terraform for infrastructure
│ ├── main.tf
│ └── outputs.tf
│
├── ansible/ # Ansible for configuration
│ ├── playbook.yml
│ ├── inventory.ini
│ ├── group_vars/
│ │ └── all.yml
│ ├── terraform_outputs.yml # Auto-generated
│ └── roles/
│ ├── prometheus/
│ ├── grafana/
│ ├── alertmanager/
│ ├── loki/
│ ├── fluentbit/
│ ├── fluentbit_web/
│ ├── node_exporter/
│ ├── webserver/
│ └── reverse_nginx/
│
├── scripts/
│ ├── generate_tf_outputs.py # Converts Terraform output to Ansible vars
│
├── deploy.sh # 🚀 Fully automates the entire pipeline
├── README.md
└── .gitignore
```
---

## ✅ Key Features

- ✅ Infrastructure provisioning via Terraform
- ✅ Dynamic DNS (Namecheap) automation
- ✅ Secure reverse proxy (Nginx + Certbot)
- ✅ Centralized logging with Fluent Bit + Loki
- ✅ Log storage in AWS S3
- ✅ Metrics collection (Prometheus + Node Exporter)
- ✅ Alerting via Slack (Alertmanager)
- ✅ Grafana dashboards and visualizations
- ✅ Fully automated setup via `deploy.sh`

---

## 🚀 Usage (One Command Setup)

```bash
./deploy.sh
```

This single script handles:

- ✅ Terraform initialization and apply
- ✅ Fetching the monitoring server’s public IP
- ✅ Updating your Namecheap A record
- ✅ Waiting for DNS to propagate
- ✅ Generating Terraform outputs for Ansible
- ✅ Running the Ansible playbook end-to-end  

✅ Within minutes, your entire infrastructure will be ready and accessible via HTTPS.

📊 Access Grafana Dashboards

Once deployed, visit:
```arduino
https://monitoring.yourdomain.com/
```
Available dashboards include:

-  🖥️ Node Metrics (CPU, RAM, Disk)
-  📦 Fluent Bit Logs (searchable via Loki)
-  ⚠️ Triggered Alerts
-  🌐 Webserver access logs

📣 Alerting

Alerts are configured using Prometheus Alert Rules + Alertmanager, and routed to your Slack channel. Examples:

-  🔴 Instance down
-  ⚠️ High memory usage
-  🐞 Error logs detected by Fluent Bit
-  🛑 Loki not ingesting data

Ensure your Slack webhook is correctly defined in group_vars/all.yml.

🧠 Notes

-  The SSL certificate is issued by Certbot, triggered automatically during the Ansible run
-  The domain A record is updated via Namecheap Dynamic DNS in deploy.sh
-  All logs from Fluent Bit are shipped to Loki and stored in S3
-  Systemd overrides inject AWS credentials into the Loki service securely via environment variables

