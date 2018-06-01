require "gtfo/version"
require 'nokogiri'
require 'open-uri'
require 'pry'

module Gtfo
  class Scraper 
    @destinations = []
    def get_page(url)
      doc = Nokogiri::HTML(open("http://www.travelandleisure.com/trip-ideas/best-places-to-travel-in-2018"))
      
      doc.css(".media-body").each do |destination|
        
      end
      
      
    end
  end
end

# big (box of data) = doc.css(".media-body")
# first = first one
# Title = .css("h2").strip
# description = .css("p").text 
