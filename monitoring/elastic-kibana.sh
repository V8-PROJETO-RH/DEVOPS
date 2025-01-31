#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get install -y openjdk-21-jdk wget curl apt-transport-https

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list

sudo apt-get update -y
sudo apt-get install -y elasticsearch kibana

sudo sed -i 's/#network.host: /network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/#http.port: 9200/http.port: 9200/' /etc/elasticsearch/elasticsearch.yml

sudo sed -i 's/#server.host: ""/server.host: "0.0.0.0"/' /etc/kibana/kibana.yml
sudo sed -i 's/#elasticsearch.hosts: \["http:\/\/:9200"\]/elasticsearch.hosts: ["http:\/\/:9200"]/' /etc/kibana/kibana.yml

sudo systemctl daemon-reload
sudo systemctl enable elasticsearch
sudo systemctl enable kibana
sudo systemctl start elasticsearch
sudo systemctl start kibana