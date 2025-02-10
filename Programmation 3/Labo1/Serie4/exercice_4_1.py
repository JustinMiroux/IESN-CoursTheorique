# -*- coding: utf-8 -*-

""" Labo 1 - Exercice 4.1.x """


def simplecomparaison(x):
    """Print if x is bigger or not than 100"""
    if x > 100:
        print("A is bigger then 100")
    else:
        print("A is smaller then 100")


def multiplecomparaison(x):
    """Print if x is either positive, negative or null"""
    if x > 0:
        print("A is positive")
    elif x < 0:
        print("A is negative")
    else:
        print("A is null")


def conditionedcomparaison(x, y):
    """Verify if x and y are equal to 2"""
    if x == 2 and y == 2:
        print("This test is true")


if __name__ == "__main__":
    A = 0
    X = 2
    Y = 2
    simplecomparaison(A)
    multiplecomparaison(A)
    conditionedcomparaison(X, Y)
