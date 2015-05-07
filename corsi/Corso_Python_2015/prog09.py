#!/usr/bin/env python3

def leggi_file():
    statistica = {}
    fin = open("testo.txt")
    for linea in fin:
        parole = linea.strip().split(" ")
        for parola in parole:
            if parola in statistica:
                statistica[parola] += 1
            else:
                statistica[parola] = 1
                #statistica.update({parola: 1})
    return statistica

def stampa_statistica(statistica):
    for parola, num in statistica.items():
        print("La parola {0} compare {1} volte".format(parola, num))

stat = leggi_file()
stampa_statistica(stat)
