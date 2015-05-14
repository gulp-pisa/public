#!/usr/bin/env python3

import urllib.request
import json
import pprint

response = urllib.request.urlopen("http://api.openweathermap.org/data/2.5/forecast?q=Pisa,it")
json_data = response.read()
data = json.loads(json_data.decode("utf8"))
print(data)
pprint.pprint(data)
