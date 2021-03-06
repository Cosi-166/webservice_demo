require 'json'
require 'xmlsimple'
require 'byebug'
#
# This example illustrates conversions between JSON, XML and Ruby Hashes which are often
# required when working with web services.
#

person_as_json_string = '{"name": "Pito", "town": "Arlington"}'
person_as_ruby_hash = JSON.parse(person_as_json_string)
puts "\n>>> 1. Single person in JSON: #{person_as_ruby_hash}"

puts "\n>>> 2. Convert a ruby hash to json and vice versa"
person_list_as_hash = '[{"name": "Pito", "town": "Arlington"},
                   {"name": "Chris", "town": "Willemstad"},
                   {"name": "Amin", "town": "Lafayette"}]'
person_list_as_string = JSON.parse(person_list_as_hash)
puts person_list_as_string

puts "\n>>> 3. Convert from from XML to JSON - via a Ruby Hash?"

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

xml_clean = person_as_xml_string.gsub(/\s/, '')
xml_hash =  XmlSimple.xml_in(xml_clean, {'ForceArray' => false})
xml_json = xml_hash.to_json

puts "\n>>> 4. Original String: \n#{person_as_xml_string}"
puts "\nCleanedup xml string:", xml_clean
puts "\nConverted to a hash:", xml_hash
puts "\nConverted to a json string:", xml_json
