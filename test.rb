require 'rubygems'
require 'plist'
require 'nokogiri'

contents = File.read('myView.xib')

doc = Nokogiri::XML(contents)

doc.xpath('//archive/data/object/object').each do |node|
   if node['class'] == 'IBUIView' then
     node.xpath('.//object').each do |o|
       puts o #if o['class'] == 'IBUIButton'
     end
   end
end
