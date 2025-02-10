---
title: "Cours 1"
author: [Justin]
date: "17-09-2024"
lang: "fr"
---
# Programmation 3 (17-09-2024)
*Programmation en python*

## Cours numéro 1

### Intro :
- **PEP8** : Standard de mise en forme python (gérer par la machine)
    - 4 espaces : 4 espaces d'indentation forment un bloc
- **ZEN** : Code lisible pour une autre personne (Bonne Pratique)
- Philosophie de python : *import this* (faire au plus simple)
- Les varaibles : 
    - Pas de types : pas besoin de spécifier le type la machine le determine toute seule
    - Typage dynamique : On peut redeclarer la varriable (sous un autres types) sans pour autant devoir changer la façon dont on l'appel
    - Typage statique il est impossible de redéclarer la variable en changant sont types
    - Statique ou dynamique ? Statique moins de bug que dynamique car moins de changement de types qui peut créer des erreures.
    - Porter des varriables : En python celle-ci est global on peut donc y accéder tous le temps contrairement au C.
- **Main** : il n'est pas obligatoire mais peut etre utilisé.
- Les commentaires s'écrive avec des : *#*
- **Return** : Signale la fin de l'instruction.
- Python language interpreteur : pas besoin de compiler, intérpreter en directe. (fichier.py n'est que du texte).
- La mémoire : python octroie dynamiquement la mémoire pas besoin de le faire manuellement. Exemple : 
~~~
#mem "statique"
a = 5
b = "Python"

#mem "dynamique"
#pas de malloc!

l = [] #liste
l.append(5)
~~~
- Comparaison :
    - == : égalité
    - is : identité

- Caching : Utilisation du caching en Python ce qui veut dire que plusieurs variables aillant la même valeur auront la même identité.

### Les types :
Différents types de language les fortements typés (C, ...) et les légèrements typés (javascript, ...) Python se rapproche plus du fortement typés que le légèrement.

Pour connaitre les types : https://docs.python.org/3/library/stdtypes.html


