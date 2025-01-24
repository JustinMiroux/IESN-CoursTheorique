---
title: "Commandes"
author: [Justin]
date: "04-10-2024"
lang: "fr"
---

# Les Commandes Routeur Cisco

**NOTES : Toutes les IP montrées sont des exemples**

### Commandes de base :

* ```no``` = permet de défaire n'importe quel commande
* ``erase startup-config`` = Supprime la configuration sauvegarder
* ``reload`` = Redémarre le routeur
* ``enable`` = Active le routeur
* ``conf t`` = Entre en mode Configuration
* ``no ip domain-lookup`` = Désactive la recherche DNS
* ``hostname`` = Définit le nom du routeur
* ``line console 0`` & ``logging synchronous`` = Configure la console en mode synchrone
* ``int`` = Permet de configurer une interface
* ```clock rate 56000``` = Vitesse de clock sur interface (!Faire seuleument si on est le DCE)

## IPV4

* ```ip add 192.168.1.1 255.255.255.0``` = Configurer une IPV4 sur une interface

### Route statique

* ```ip route 192.168.1.0 255.255.255.0 192.168.1.193``` = Route récursive (1. l'addresse du réseaux 2. le mask du réseaux 3. Le routeur par lequelle il faut passer pour accéder au réseaux en question)
* ```ip route 192.168.1.0 255.255.255.0 s0/1/0``` = Route directement connectée (1. l'addresse du réseaux 2. le mask du réseaux 3. Interface par laquelle il faut passer pour accéder au réseaux)

### Route par défault

* ```ip route 0.0.0.0 0.0.0.0 192.168.1.194``` = = Route récursive (1. l'addresse du réseaux 2. le mask du réseaux 3. Le routeur par lequelle il faut passer pour accéder au réseaux en question)
* ```ip route 0.0.0.0 0.0.0.0 s0/1/0``` = Route directement connectée (1. l'addresse du réseaux 2. le mask du réseaux 3. Interface par laquelle il faut passer pour accéder au réseaux)

## IPV6

* ```ipv6 unicast-routing``` = Active le routage IPV6 sur le routeur
* ```ipv6 address 2001:DB8:ACAD:A::/64 eui-64``` = Configurer une IPV6 sur l'interface (EUI-64 est utilisé pour créer l'identifiant d'interface partie de l'adresse)
* ```ipv6 address FC00::1/64``` = Configurer une IPV6 local sur l'interface (L'interface S0/1/0 a un routable privé, unique-local adresse, ce qui est recommandé pour les connexions série point à point)

### Route statique

* ```ipv6 route 2001:DB8:ACAD:B::/64 s0/1/0``` = Route directement connectée (La route entrée spécifie l'interface de sortie du routeur, ce type de route est surtout utilisé dans les liaisons point-à-point)
* ```ipv6 route 2001:DB8:ACAD:B::/64 FC00::2``` = Route récursive (L'entrée de la route à l'adresse IPV6 du routeur suivant)

### Route par défault

* ```ipv6 route ::/0 s0/1/0``` = Route directement connectée
* ```ipv6 route ::/0 FC00::2``` = Route récursive

## VLAN

* ``vlan 10`` = Créer une vlan avec l'id 10
* ``name VLAN10`` = Nomme la Vlan

In interface configuration :
* ``switchport mode access`` = Change le port en mode accès
* ``switchport access vlan 10`` = Change l'accés a la vlan avec l'id 10

Configuration de trunk (Entre switch L2 and L3):
* ``switchport mode trunk`` = Change le port en mode trunk
* ``switchport trunk allowed vlan 10,11``

Configuration du routage inter VLAN (Entre routeur et switch L2):
* ``int g0/0/0.10`` = Permet de configurer l'interface avec l'id vlan
* ``encapsulation dot1q 10`` = Active l'encapsulation pour la vlan 10
* ``ip add ...`` = Configuration interface (Voir IPV4)

## RIPV2

* ``router rip`` = Entrez en mode configuration du rip
* ``version 2`` = Specifier que l'on va utiliser la version 2 du protocol rip (par défault version 1)
* ``network 192.168.1.194`` = Définir les interfaces (réseau) participant au RIP (ceux qui sont directement connecté a notre routeur)
* ``network 192.168.1.0`` = Ajouter un autre réseau participant
* ``passive-interface g0/0/0`` = Définir les interfaces qui ne sont pas en face d'un routeur, afin qu'on ne leur envois pas les infos de routage
* ``no auto-summary`` = Désactive le résumer de route

! Le réseau vers internet ne participe pas à notre routage RIP. Pour le routeur connecter a internet faire une route par défault sur l'interface.

! Pour partager la route (a ne faire que sur le routeur qui a la route par défault):
* ``router rip`` = Entrez en mode configuration du rip
* ``default-information originate`` = propague la route au reste du réseau RIP

## OSPF

* ``router ospf 1`` = Active l'ospf version 1 pour le routeur
* ``router-id 1.1.1.1`` = Definit un id pour le routeur (Unique par routeur)
* ``network 10.10.10.0 0.0.0.255 area 0`` = Définit un réseaux pour l'ospf.