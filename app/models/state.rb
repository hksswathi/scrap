require 'rubygems'
require 'nokogiri'
require 'open-uri'
class State < ActiveRecord::Base
	has_many :cities
def self.scrap
logger.info("hi this is scrapping");
url="http://jobsearch.naukri.com/jobs-by-location.php?id="
logger.info("this is url"+url);
doc=Nokogiri::HTML(open(url));
@name = State.new
@old_state = @name
doc.css('div.brwsLoc a').each do |i|

@city=i.text
if i.attributes['class'].to_s == "stLink"
@name.name = i.text
logger.info("this is state #{@name}") 
@name.save
@old_state = @name
@name = State.new
else
begin


	logger.info("this is city")

@cities = @old_state.cities.build 
@cities.name=@city 
@cities.save 
rescue nil
	puts "rescued"
end
end
end
end
end
