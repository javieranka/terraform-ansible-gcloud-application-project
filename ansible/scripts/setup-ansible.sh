#!/bin/bash
set -e

echo "[1/6] Instalacja Ansible i Git..."
sudo apt update -y
sudo apt install -y ansible git

echo "[2/6] Klonowanie repozytorium do katalogu tymczasowego..."
git clone https://github.com/javieranka/terraform-ansible-gcloud-application-project.git "/tmp/ansible-repo"

echo "[3/6] Tworzenie docelowego katalogu /ansible..."
sudo mkdir -p /ansible
sudo cp -r "/tmp/ansible-repo/ansible/"* /ansible/

echo "[4/6] Instalacja kolekcji community.mysql..."
ansible-galaxy collection install community.mysql

echo "[5/6] Czyszczenie katalogu tymczasowego..."
rm -rf "/tmp/ansible-repo"

echo "[6/6] Gotowe! Uruchom playbook ręcznie, jeśli chcesz:"
ansible-playbook /ansible/playbooks/main.yml -i /ansible/inventory/vamos-hosts.ini
