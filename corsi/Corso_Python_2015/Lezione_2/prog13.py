#!/usr/bin/env python3

from collections import Counter

def leggi_file():
    fin = open("testo.txt")
    counter = Counter([parola for parola in
                       fin.read().replace('\n', ' ').split(' ')
                       if parola != ''])

    fin.close()

    return counter

def stampa_statistica(statistica):
    lista = [(num, parola) for (parola, num) in statistica.items()]
    for num, parola in sorted(lista):
        print("La parola {0} compare {1} volte".format(parola, num))

stat = leggi_file()
stampa_statistica(stat)
