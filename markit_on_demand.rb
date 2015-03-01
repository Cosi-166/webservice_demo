require 'typhoeus'
require 'xmlsimple'
require 'pp'

result = Typhoeus.get("http://dev.markitondemand.com/Api/v2/Quote?symbol=msft")
xml = result.response_body

puts "**** Resultant XML from call to the markitondemand service"
puts xml
puts

hash = XmlSimple.xml_in(xml)
puts "**** Convert that xml to a ruby hash:"
pp hash


