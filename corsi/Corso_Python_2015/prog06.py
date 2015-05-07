#!/usr/bin/env python3

contatore = 0
finito = False
while not finito:
    leggi = input()
    if leggi == "finito":
        finito = True
    else:
        numero = int(leggi)
        contatore += numero

print(contatore)
