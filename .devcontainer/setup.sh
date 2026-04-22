#!/bin/bash

set -e

 

echo "=== Installing dependencies ==="

sudo apt-get update -qq

sudo apt-get install -y -qq mysql-server wget curl unzip

 

echo "=== Starting MySQL ==="

sudo service mysql start

sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root123';"

sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS auth_db;"

sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS product_db;"

sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS order_db;"

sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS payment_db;"

sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS shipping_db;"

sudo mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS notification_db;"

echo "=== Databases created ==="

 

echo "=== Installing Kafka ==="

wget -q https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz -O /tmp/kafka.tgz

tar -xzf /tmp/kafka.tgz -C /opt/

sudo mv /opt/kafka_2.13-3.7.0 /opt/kafka

echo "export KAFKA_HOME=/opt/kafka" >> ~/.bashrc

echo "export PATH=$PATH:/opt/kafka/bin" >> ~/.bashrc

source ~/.bashrc

 

echo "=== Kafka installed at /opt/kafka ==="

echo "Setup complete!"
