# -*- coding: utf-8 -*-

""" Labo 1 - Exercice 3.1.x """


def ispresent(astring):
    """Tells if yes or no the letter "e" is present in the string of character"""
    return bool(astring.find("e"))


def occurences(astring):
    """Number of times the letter "e" appears in astring"""
    return astring.count("e")


def stripandadd(astring):
    """Divide all character in the string and add a "*" between every character"""
    return "*".join(astring)


def reversedstring(astring):
    """Write everything from right to left"""
    return astring[::-1]


if __name__ == "__main__":
    MYSTRING = "Ceci est une astring de charactère"
    print(ispresent(MYSTRING))
    print(occurences(MYSTRING))
    print(stripandadd(MYSTRING))
    print(reversedstring(MYSTRING))
