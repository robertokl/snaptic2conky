require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'

n = Nokogiri::HTML(open("https://api.snaptic.com/v1/notes.xml", :http_basic_authentication => ARGV))
n.xpath("//note").each do |note|
  next unless note.children.find_all { |node| node.name == 'tags' }.first.children.find_all {|node| node.text == "ignore"}.empty?
  puts "- " + note.children.find_all { |node| node.name == 'text' }.first.text
end
