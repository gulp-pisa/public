# Da prog11.py della lezione 2, modificato con "path"

def leggi_file(path):
    statistica = {}
    fin = open(path)
    for linea in fin:
        parole = linea.strip().split(" ")
        parole2 = []

        parole = [parola for parola in parole if parola != '']

        for parola in parole:
            if parola in statistica:
                statistica[parola] += 1
            else:
                statistica[parola] = 1

    fin.close()

    return statistica

