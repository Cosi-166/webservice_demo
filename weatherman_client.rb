# DOESNT WORK ANYMORE!

require 'yahoo_weatherman'
require 'pry-byebug'

client = Weatherman::Client.new
binding.pry

puts client.lookup_by_location('02474').forecasts[0]['high']
puts client.lookup_by_location('02474').forecasts[0]['low']
puts client.lookup_by_location('olathe, ks').condition['temp']
puts client.lookup_by_location('north pole').condition['temp']
puts client.lookup_by_location('sydney opera house').condition['temp']
