#!/usr/bin/env python3

def leggi_numeri():
    finito = False
    lista = []
    while not finito:
        leggi = input()
        if leggi == "finito":
            finito = True
        else:
            numero = int(leggi)
            #lista = lista + [numero]
            #lista += [numero]
            lista.append(numero)
    return lista

def somma(lista):
    contatore = 0
    for elemento in lista:
        contatore += elemento
    return contatore

lista = leggi_numeri()
print(somma(lista))
