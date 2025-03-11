# Commande Vagrant

```
vagrant init debian/bookworm64
vagrant up
vagrant ssh
vagrant suspend
vagrant resume
vagrant halt
vagrant destroy
vagrant box list
vagrant box remove debian/bookworm64
```

## Commande du laboratoire

Pour ce laboratoire il faut que vagrant a chaque démarrage de la machine installe docker. Pour le faire on va utiliser un script.

### Créer un dossier et initié la machine vagrant
```bash
mkdir vagrant_labo
cd vagrant_labo

vagrant init debian/bookworm64 # debian/bookworm64 peut ètre remplacer par n'importe quel autre distribution exemple ubuntu/trusty64
```

### Configurer le vagrantfile

Ici nous configurons le vagrantfile pour que le dossier vagrant_labo soit partager avec la machine afin que celle-ci puisse lancer le script présent dans le dossier partagé.

```vagrantfile

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/bookworm64"

  config.vm.synced_folder ".", "/vagrant", disabled: false

  config.vm.provision :shell, path: "bootstrap.sh"

end

```

### Le script d'installation

```bash
#!/usr/bin/env bash

apt-get update
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Pour finir

```bash
vagrant up
```
OU
```bash
vagrant reload --provision
```
Si la machine est déjà lancé