#!/usr/bin/env python3

def leggi_file():
    statistica = {}
    fin = open("testo.txt")
    for linea in fin:
        parole = linea.strip().split(" ")
        parole2 = []

        #for parola in parole:
        #    if parola != '':
        #        parole2.append(parola)
        #        #parole2 += [parola]
        #parole = parole2

        parole = [parola for parola in parole if parola != '']

        for parola in parole:
            if parola in statistica:
                statistica[parola] += 1
            else:
                statistica[parola] = 1
                #statistica.update({parola: 1})

    fin.close()

    return statistica

def stampa_statistica(statistica):
    for parola, num in statistica.items():
        print("La parola {0} compare {1} volte".format(parola, num))

stat = leggi_file()
stampa_statistica(stat)
