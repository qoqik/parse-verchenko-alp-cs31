require 'nokogiri'
require 'open-uri'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'
html = URI.open(url)
doc = Nokogiri::HTML(html)

doc.css('#BlinkDBContent_849210 ul li a').each do |element|
  href = element['href']
  hospital_id = href.split('/').last
  hospital_name = element.text
  puts "ID: #{hospital_id}, Name: #{hospital_name}"
end
