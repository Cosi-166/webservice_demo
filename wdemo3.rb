require 'typhoeus'
require 'xmlsimple'
require 'pp'
require 'minitest/autorun'

# This is a code sample. It has lots of room for improvement. Normally I
# would not have the test in the same file as the class itself.

class SecurityBase
  MARKETONDEMANDURL = "http://dev.markitondemand.com/Api/v2/Quote?symbol=%s"

  def self.price(secname)
    xml = self.memoize_xml(secname)
    XmlSimple.xml_in(xml)["LastPrice"].first.to_f
  end

  def self.name(secname)
    xml = self.memoize_xml(secname)
    XmlSimple.xml_in(xml)["Name"].first
  end

  def self.memoize_xml(secname)
    @xml_cache = {} if @xml_cache.nil?
    xml = @xml_cache[secname]
    if xml.nil?
      xml = Typhoeus.get(MARKETONDEMANDURL % secname).response_body
      @xml_cache[secname] = xml
    end
    xml
  end

end


describe SecurityBase do

  it "Can return the price of google" do
    SecurityBase.price("GOOG").must_be :>, 0
  end

  it "Returns different prices for different stocks" do
    (SecurityBase.price("GOOG") - SecurityBase.price("AAPL")).wont_equal 0
  end

  it "Returns the name of the security" do
    SecurityBase.name("MSFT").must_equal "Microsoft Corp"
  end


end
