<h1>Vagrant Challenge </h1>
<h3> 📖 About The Project </h3>
This project aims to create a standardized development environment to ensure developers get consistent results with the same code base. A Vagrant virtual machine was created and provisioned automatically to run a Flask-based application. The project includes a simple Flask application and enables quick reflection of code changes within the virtual machine. 
<hr>
<h3>⚙️ Technologies Used </h3>
<ol> 
<li>Vagrant: For managing and configuring virtual machines.</li>
  <li>VirtualBox: Virtual machine provider.</li>
  <li>Flask: Python-based micro web framework.</li>
</ol>
<hr>
<h3>🚀 Setup and Usage </h3>
<h5> 1 . Prerequisites</h5>
<ol>
  <li><a href="https://developer.hashicorp.com/vagrant/install?product_intent=vagrant#windows">Vagrant Download</a></li>
  <li><a href="https://www.virtualbox.org/wiki/Downloads">VirtualBox Download</li>
    <li><a href="https://git-scm.com/downloads">Git Download</li>
</ol>
      <h5> 2 . Clone the Repository </h5>

   ```bash
   git clone <repo-url>
   cd <repo-directory>
```
  <h5> 3 . Start the Vagrant Virtual Machine </h5>
  
  ```bash 
  vagrant up
```
<p>This command: </p>
<ul>
  <li>Creates the virtual machine.</li>
  <li>Runs the provisioning scripts.</li>
  <li>Starts the Flask application.</li>
</ul>

<h5> 4 . View the Application </h5>
<p> Open http://localhost:5000 in your browser to view the Flask app. </p>
<hr>
<h3> 📋 Project Steps </h3> 

<h5> 1. Developing the Flask Application <h5>
<ul><li>A simple Flask application was created.</li></ul>
  
 ```bash 
 from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Flask!"

if __name__ == '__main__':
    app.run(debug=True)
```
 
  
<h5> 2. Writing the Vagrantfile <h5>
<ul>
  <li>A base image of the latest Ubuntu version was selected.</li>
  <li>Network configurations and synced folders were set up in the Vagrantfile.</li>
</ul>

```bash

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  #ağ çakışmalarını önlemek için özel ip adresi ataması.
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.boot_timeout = 600

  #provisioning bash script 
  config.vm.provision "shell", path: "provision.sh"

  config.vm.synced_folder ".", "/vagrant" #flash koduna vm üzerinden kolayca erişebilme.

end
```


<h5> 3. Creating the Provisioning Script</h5>
<ul>
  <li>Installed Python and Flask dependencies in the virtual machine.</li>
  <li>Started the Flask application automatically during provisioning.</li>
</ul>

```bash
#!/bin/bash

# Güncelleme ve gerekli paketlerin yüklenmesi
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip

# Flask kurulumu
pip3 install flask

# Flask uygulamasını başlatma
FLASK_APP=/vagrant/app.py flask run --host=0.0.0.0 &
```



<h5> 4 .Enabling Rapid Code Reflection </h5>
<ul>
  <li>Configured a synced folder to ensure changes made locally were reflected in the virtual machine instantly.</li>
  <li>Enabled Flask debug mode for faster testing and development.</li>
</ul>

<hr>




