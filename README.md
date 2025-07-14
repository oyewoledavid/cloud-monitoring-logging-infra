# Cloud Monitoring and Logging Infrastructure

This project sets up a real-world cloud monitoring and logging infrastructure on AWS using **Terraform**, **Ansible**, **Prometheus**, **Grafana**, **Loki**, and **Fluent Bit**.

> ⚙️ Project is still in progress — more components (e.g., multi-node scaling, dashboards, alerting rules) will be added soon.

---

## 📌 Overview

This infrastructure enables:

- ✅ Provisioning of EC2 instances using Terraform
- ✅ Monitoring with **Prometheus** and visualization with **Grafana**
- ✅ Logging with **Fluent Bit** and **Loki**
- ✅ Alerting with **Alertmanager** integrated with Slack

---

## 🚀 Tech Stack

| Layer        | Tool                     |
| ------------ | ------------------------ |
| IaC          | Terraform                |
| Configuration | Ansible                 |
| Monitoring   | Prometheus, Grafana      |
| Logging      | Fluent Bit, Loki         |
| Alerts       | Alertmanager + Slack     |
| Cloud        | AWS (EC2, Security Groups, VPC, etc.) |

---

## 🏗️ Project Structure

cloud-monitoring-logging-infra/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── ansible/
│   ├── playbook.yml
│   ├── roles/
│   │   ├── prometheus/
│   │   ├── grafana/
│   │   ├── loki/
│   │   └── fluentbit/
│   │   
│   │       
│   │       
│   │           
│
├── README.md
├── .gitignore



---

## ✅ Completed so far

- [x] Terraform provisioning of monitoring EC2 instance
- [x] Installation of Prometheus, Grafana and Alertmanager
- [x] Slack alerting via Alertmanager
- [x] Loki installation
- [x] Fluent Bit configuration and log shipping

---

## 🛠️ Work in Progress

- [ ] Auto-deploy multiple monitored EC2 instances
- [ ] Grafana dashboards for Loki logs
- [ ] Loki data retention policies
- [ ] End-to-end CI/CD for infrastructure

---

## 📦 Getting Started

> Clone the repository and initialize Terraform:
```bash
git clone https://github.com/your-username/cloud-monitoring-logging-infra.git
cd cloud-monitoring-logging-infra/terraform
terraform init
terraform apply  
```
Then run Ansible:
```bash
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
```

