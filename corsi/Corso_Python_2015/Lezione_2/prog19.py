#!/usr/bin/env python3

import urllib.request
import urllib.error
import json
import sys
import time

# Eccezione di prova
try:
    raise Exception("Lancio un'eccezione")
except:
    print("C'è stata un'eccezione")

# Fa cinque tentativi per contattare il server, aspettando un secondo
# tra un tentativo e l'altro
for i in range(5):
    try:
        response = urllib.request.urlopen("http://api.openweathermap.org/data/2.5/forecast?q=Pisa,it")
    except:
        time.sleep(1.0)
    else:
        break
else:
    print("Non sono riuscito a prendere il documento")
    sys.exit()

try:
    json_data = response.read()
    data = json.loads(json_data.decode("utf8"))
except ValueError:
    print("Il JSON non è valido, mi dispiace")
    sys.exit()

print("Informazioni per la città di {0}".format(data['city']['name']))
for info in data['list']:
    print("Alle ore {0} la temperatura è {1:.3}".format(info['dt_txt'],
                                                        info['main']['temp'] - 273.15))
