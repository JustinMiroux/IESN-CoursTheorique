# -*- coding: utf-8 -*-

""" Labo 2 - Exercice 1.1.x """

def printclass():
    """Print the class of the variables"""

    v1 = "this is a string"
    v2 = 11
    v3 = 11.11

    print(type(v1))
    print(type(v2))
    print(type(v3))


class MyObject:
    """Just an empty class"""


def compareinstances(a, b):
    """compare two instaces of the same class"""
    print(bool(a == b))
    print(bool(a is b))


if __name__ == "__main__":
    printclass()

    M = MyObject()
    print(type(M))
    M = MyObject
    print(type(M))

    A = MyObject()
    B = MyObject()
    compareinstances(A, B)

    A = MyObject
    B = MyObject
    compareinstances(A, B)
