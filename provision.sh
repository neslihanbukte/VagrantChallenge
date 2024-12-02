#!/bin/bash

# Güncelleme ve gerekli paketlerin yüklenmesi
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip

# Flask kurulumu
pip3 install flask

# Flask uygulamasını başlatma
FLASK_APP=/vagrant/app.py flask run --host=0.0.0.0 &