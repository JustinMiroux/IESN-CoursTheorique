# -*- coding: utf-8 -*-

""" Labo 1 - Exercice 3.2.x """


def joinedlist(list1, list2):
    """Join list1 and list2 together"""
    list3 = []

    for i in enumerate(list1):
        counter = i[0]
        list3.extend([list2[counter], list1[counter]])

    return list3


def cleanprint(alist):
    """print clearly the list"""
    for month in alist:
        print(month)


def bigtosmall(alist):
    """Print the values from the biggest to the smallest"""
    biggest = 0

    for i in alist:
        biggest = max(biggest, i)

    return biggest


def pairornotlists(alist):
    """Divide de pair and impair numbers into a list for each"""
    pairlist = []
    impairlist = []

    for i in alist:
        if (i % 2) == 0:
            pairlist.append(i)
        else:
            impairlist.append(i)

    return pairlist, impairlist


def moreorlesscaracter(alist):
    """
    Take a list of words and divide said words into two list
    based on the numbers of caracter of the words (<6)
    """
    smalllist = []
    biglist = []

    for words in alist:
        if len(words) < 6:
            smalllist.append(words)
        else:
            biglist.append(words)

    return smalllist, biglist


if __name__ == "__main__":

    t1 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    t2 = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout",
           "Septembre", "Octobre", "Novembre", "Décembre"]
    t3 = [32, 5, 12, 8, 3, 75, 2, 15]
    t4 = ["Jean", "Maximilien", "Brigitte", "Sonia", "Jean-Pierre", "Sandra"]

    print(joinedlist(t1, t2))
    cleanprint(t2)
    print("The biggest number is :", bigtosmall(t3))
    print(pairornotlists(t3))
    print(moreorlesscaracter(t4))
