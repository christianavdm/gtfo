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
    
    def self.start 
      puts "time to gtfo"
      puts "to go to a randomly assigned destination, type gtfo"
      puts "to see the top 5 travel destinations, type top" 
    end
    
    def self.top
      puts "top 5 destinations"
      self.all[0..4].each.with_index(1) {|d, i| puts "#{i}. #{d.name}"}
    end
    
    def navigation
      input = gets.strip
      if input.downcase == "next" 
        self.menu
      elsif input.downcase == "last"
        self.menu
      else 
        puts "I didn't understand that."
        self.menu
      end
    end
    
    def menu 
      puts "to see the next 5, type next"
      puts "to see the last 5, type last"
      puts "to go to a randomly assigned destination, type gtfo"
    end
    
    binding.pry
  end
end


