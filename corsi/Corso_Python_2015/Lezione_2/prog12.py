#!/usr/bin/env python3

from collections import Counter

def leggi_file():
    fin = open("testo.txt")
    parole = [parola for parola in
              fin.read().replace('\n', ' ').split(' ')
              if parola != '']
    counter = Counter()
    for parola in parole:
        counter.update({parola: 1})

    fin.close()

    return counter

def stampa_statistica(statistica):
    for parola, num in statistica.items():
        print("La parola {0} compare {1} volte".format(parola, num))

stat = leggi_file()
stampa_statistica(stat)
