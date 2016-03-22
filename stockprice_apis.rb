require 'typhoeus'
require 'xmlsimple'
require 'pry-byebug'
require 'awesome_print'
require 'nori'

# Referece for the Quandli API: https://www.quandl.com/docs/api#basic-data-request

my_quandl_key = "N8-jmq2wzzKEevohKeUc"

result = Typhoeus.get("https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.json?order=asc&exclude_column_names=true&start_date=2012-01-01&end_date=2013-01-01&column_index=4&collapse=monthly&transformation=rdiff")

puts "**** RAW JSON"
ap result.response_body
stock_price = JSON.parse(result.response_body)

puts "*** Converted to a hash"
ap stock_price
