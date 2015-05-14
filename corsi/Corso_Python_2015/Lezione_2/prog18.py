#!/usr/bin/env python3

import urllib.request
import urllib.error
import json
import sys

try:
    response = urllib.request.urlopen("http://api.openweathermap.org/data/2.5/forecast?q=Pisa,it")
    json_data = response.read()
    data = json.loads(json_data.decode("utf8"))
except ValueError:
    print("Il JSON non è valido, mi dispiace")
    sys.exit()
except urllib.error.URLError:
    print("Non sono riuscito a contattare il server")
    sys.exit()

print("Informazioni per la città di {0}".format(data['city']['name']))
for info in data['list']:
    print("Alle ore {0} la temperatura è {1:.3}".format(info['dt_txt'],
                                                        info['main']['temp'] - 273.15))
