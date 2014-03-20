require 'json'
 
puts "\nAnd the other way around"
name_hash = '{"name": "Pito", "town": "Arlington"}'
puts JSON.parse(name_hash)

name_list_hash = '[{"name": "Pito", "town": "Arlington"}, 
                   {"name": "Chris", "town": "Willemstad"}, 
                   {"name": "Amin", "town": "Lafayette"}]'
puts JSON.parse(name_list_hash)

puts "\n*** How about converting from XML to JSON?"
require 'xml-simple'

xml = <<EOS
<?xml version="1.0" encoding="UTF-8"?>
<student>
  <name>
    Pito Salas
  </name>
  <gender>
    male
  </gender>
</student>
EOS

puts "*****", xml



xml_clean = xml.gsub(/\s/, '')

xml_hash =  XmlSimple.xml_in(xml_clean , { 'ForceArray' => false })
xml_json = xml_hash.to_json

puts "Input xml string:", xml_clean
puts "\nConverted to a hash:", xml_hash
puts "\nConverted to a json string:", xml_json