---
title: "Commandes"
author: [Justin]
date: "04-10-2024"
lang: "fr"
---

# Les Commandes Routeur Cisco

**NOTES : Toutes les IP montrées sont des exemples**

### Commandes de base :

* ``erase startup-config`` = Supprime la configuration sauvegarder
* ``reload`` = Redémarre le routeur
* ``enable`` = Active le routeur
* ``conf t`` = Entre en mode Configuration
* ``no ip domain-lookup`` = Désactive la recherche DNS
* ``hostname`` = Définit le nom du routeur
* ``line console 0`` & ``logging synchronous`` = Configure la console en mode synchrone
* ``int`` = Permet de configurer une interface

## IPV4

* ``ìp add 192.168.1.1 255.255.255.0`` = Configurer une IPV4 sur une interface
