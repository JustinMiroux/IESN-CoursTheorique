Pour introduire le **routage dynamique avec OSPF**, nous allons modifier légèrement la configuration précédente afin de déclarer les VLANs et les interfaces relevant du réseau OSPF dans un processus OSPF. Cela évitera de configurer des **routes statiques** manuellement et permettra une communication dynamique et évolutive entre toutes les VLANs.

Voici la configuration mise à jour avec **OSPF**. Chaque switch et routeur sera configuré pour inclure ses interfaces dans le processus OSPF. Les PCs pourront communiquer entre eux via les VLANs correspondants grâce au routage dynamique.

---

### **Configuration complète avec OSPF**

#### **SW1 (Switch 2960)**
Pas de changement pour **SW1**, car il agit uniquement comme un switch de niveau 2 et n'a pas besoin de participer au processus OSPF. La configuration reste identique.

```bash
enable
configure terminal

hostname SW1

! Création des VLANs
vlan 10
name VLAN10
exit
vlan 11
name VLAN11
exit

! Configuration des ports des PC
interface fa0/2
switchport mode access
switchport access vlan 10
exit

interface fa0/3
switchport mode access
switchport access vlan 10
exit

interface fa0/4
switchport mode access
switchport access vlan 11
exit

interface fa0/5
switchport mode access
switchport access vlan 11
exit

! Configuration du trunk entre SW1 et SL3
interface fa0/1
switchport mode trunk
switchport trunk allowed vlan 10,11
exit

! Sauvegarde
end
write
```

---

#### **SW2 (Switch 2960)**
Similairement à SW1, **SW2** n'est qu'un switch de niveau 2 et n'a pas besoin d'être configuré pour OSPF. La configuration initiale ne change pas.

```bash
enable
configure terminal

hostname SW2

! Création des VLANs
vlan 20
name VLAN20
exit
vlan 21
name VLAN21
exit

! Configuration des ports des PC
interface fa0/2
switchport mode access
switchport access vlan 20
exit

interface fa0/3
switchport mode access
switchport access vlan 20
exit

interface fa0/4
switchport mode access
switchport access vlan 21
exit

interface fa0/5
switchport mode access
switchport access vlan 21
exit

! Configuration du trunk entre SW2 et R2
interface fa0/1
switchport mode trunk
switchport trunk allowed vlan 20,21
exit

! Sauvegarde
end
write
```

---

#### **SL3 (Switch L3 – 3560)**
**SL3**, étant un switch de niveau 3, participe au processus OSPF pour annoncer les VLAN 10 et 11.

```bash
enable
configure terminal

hostname SL3

! Activer le routage inter-VLAN
ip routing

! Création des VLANs
vlan 10
name VLAN10
exit
vlan 11
name VLAN11
exit

! Configuration des interfaces VLAN (SVI)
interface vlan 10
ip address 192.168.10.254 255.255.255.0
no shutdown
exit

interface vlan 11
ip address 192.168.11.254 255.255.255.0
no shutdown
exit

! Configuration du trunk vers SW1
interface fa0/1
switchport mode trunk
switchport trunk allowed vlan 10,11
exit

! Configuration de la connexion vers R1
interface fa0/2
no switchport
ip address 80.80.80.1 255.255.255.252
no shutdown
exit

! Configuration OSPF
router ospf 1
router-id 1.1.1.1
network 192.168.10.0 0.0.0.255 area 0
network 192.168.11.0 0.0.0.255 area 0
network 80.80.80.0 0.0.0.3 area 0

! Sauvegarde
end
write
```

---

#### **R1 (Routeur 4321)**

**R1** participe au processus OSPF pour partager son réseau de transit (avec SL3 et R2). Les routes pour les VLANs 10, 11, 20, et 21 seront consolidées automatiquement via OSPF.

```bash
enable
configure terminal

hostname R1

! Configuration de l'interface vers SL3 (80.80.80.0/30)
interface gig0/0/0
ip address 80.80.80.2 255.255.255.252
no shutdown
exit

! Configuration de l'interface vers R2 (70.70.70.0/30)
interface serial0/1/0
ip address 70.70.70.1 255.255.255.252
clock rate 64000
no shutdown
exit

! Configuration OSPF
router ospf 1
router-id 2.2.2.2
network 80.80.80.0 0.0.0.3 area 0
network 70.70.70.0 0.0.0.3 area 0

! Sauvegarde
end
write
```

---

#### **R2 (Routeur 4321)**

Pour **R2**, nous configurons les sous-interfaces pour les VLANs 20 et 21. Il participe également au processus OSPF pour annoncer ces VLANs.

```bash
enable
configure terminal

hostname R2

! Configuration de l'interface GigabitEthernet0/0/0 pour gestion des VLANs
interface GigabitEthernet0/0/0
no ip address
no shutdown
exit

! Configurer les sous-interfaces pour le routage inter-VLAN
! Sous-interface pour VLAN 20
interface GigabitEthernet0/0/0.20
encapsulation dot1q 20
ip address 192.168.20.254 255.255.255.0
no shutdown
exit

! Sous-interface pour VLAN 21
interface GigabitEthernet0/0/0.21
encapsulation dot1q 21
ip address 192.168.21.254 255.255.255.0
no shutdown
exit

! Configuration de l'interface entre R2 et R1 (70.70.70.0/30)
interface serial0/1/0
ip address 70.70.70.2 255.255.255.252
no shutdown
exit

! Configuration OSPF
router ospf 1
router-id 3.3.3.3
network 192.168.20.0 0.0.0.255 area 0
network 192.168.21.0 0.0.0.255 area 0
network 70.70.70.0 0.0.0.3 area 0

! Sauvegarde
end
write
```

---

### Explications supplémentaires

1. **OSPF Area 0** : Tous les équipements participant à OSPF (SL3, R1, et R2) sont configurés dans l’**Area 0**, ce qui est requis pour une topologie OSPF de base.
2. **Routage dynamique** : OSPF assurera automatiquement le partage des routes à mesure qu’elles seront ajoutées. Vous n’avez plus besoin de configurer manuellement des routes statiques.
3. **Inter-VLAN communication** :
   - SL3 gère le routage entre VLANs locaux (**VLAN 10 et 11**).
   - R2 gère le routage entre VLANs distants (**VLAN 20 et 21**).
   - R1 agit comme un intermédiaire entre SL3 et R2 pour acheminer les paquets.
4. **Testez le routage** après la configuration : Tous les PCs des VLANs 10, 11, 20 et 21 doivent pouvoir se pinguer.