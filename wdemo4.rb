require 'typhoeus'
require 'xmlsimple'
require 'pp'

MY_API_KEY = "&apikey=4d39eb962eec3418347f549ed7daac01"
WINE_API_ROOT = "http://services.wine.com/api/beta2/service.svc/JSON"
PATH1 = "/catalog?filter=categories(490)&size=10"
PATH2 = "/catalog?filter=categories(490)&offset=10&size=5"

url = "%{url_root}%{url_rest}%{url_apikey}" % {url_root: WINE_API_ROOT, url_rest: PATH2, url_apikey: MY_API_KEY}

puts url