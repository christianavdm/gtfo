require "gtfo/version"
require 'nokogiri'
require 'open-uri'
require 'pry'

module Gtfo

  class Destination 
    attr_accessor :name, :description
    
    @@all = []  
    
    def initialize 
      @@all << self
    end
    
    def self.all 
      @@all 
    end
    
    def self.destinations_from_page
      doc = Nokogiri::HTML(open("http://www.travelandleisure.com/trip-ideas/best-places-to-travel-in-2018"))
      
      doc.css(".media-body").each do |destination|
        new_destination = Destination.new 
        new_destination.name = destination.css("h2").text.strip
        new_destination.description = destination.css("p").text
        if new_destination.name == "The 50 Best Places to Travel in 2018"
          Destination.all.delete(new_destination)
        elsif new_destination.name == ""
          Destination.all.delete(new_destination)
        end
      end
    end
    binding.pry
  end
end


