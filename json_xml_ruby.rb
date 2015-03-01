require 'json'
require 'xmlsimple'
require 'pry'
require 'pry-byebug'

 puts "\n\nConvert a ruby hash to json and vice versa"

person_as_json_string = '{"name": "Pito", "town": "Arlington"}'
person_as_ruby_hash = JSON.parse(person_as_json_string)
puts person_as_ruby_hash

person_list_as_hash = '[{"name": "Pito", "town": "Arlington"}, 
                   {"name": "Chris", "town": "Willemstad"}, 
                   {"name": "Amin", "town": "Lafayette"}]'
person_list_as_string = JSON.parse(person_list_as_hash)
puts person_list_as_string

puts "\n\n Convert from from XML to JSON?"

person_as_xml_string = <<EOS
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

puts "*****", person_as_xml_string
xml_clean = person_as_xml_string.gsub(/\s/, '')

xml_hash =  XmlSimple.xml_in(xml_clean , { 'ForceArray' => false })
xml_json = xml_hash.to_json

puts "Original String: #{person_as_xml_string}"
puts "\nCleanedInput xml string:", xml_clean
puts "\nConverted to a hash:", xml_hash
puts "\nConverted to a json string:", xml_json