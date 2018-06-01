require "gtfo/version"
require 'nokogiri'
require 'open-uri'
require 'pry'

module Gtfo
  class Destination 
    attr_accessor :name, :description
    
    @@all = []  
    @@navigation = 0
    
    def initialize 
      @@all << self
    end
    
    def self.all 
      @@all 
    end
    
    def self.navigation 
      @@navigation 
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
    
    def self.first 
      puts "time to gtfo"
      puts "to go to a randomly assigned destination, type gtfo"
      puts "to see the top 5 travel destinations, type top" 
      self.destinations_from_page
      self.start
    end
    
    def self.start
      input = gets.strip
      if input.downcase == "top"
        @@navigation == 0 
        self.print
      elsif input.downcase == "next" 
        @@navigation += 5 unless @@navigation >= 44 
        self.print
        puts "for menu options, type ?"
        self.start
      elsif input.downcase == "back"
        @@navigation -= 5 unless @@navigation <= 0
        self.print 
        puts "for menu options, type ?"
        self.start
      elsif input.downcase == "gtfo"
        puts "for menu options, type ?"
        self.start
      elsif input.to_i > 0 && input.to_i < 51
        self.destination_details
        self.start
      elsif input.downcase == "exit" 
        exit
      elsif input == "?"
        self.menu
      else 
        puts "I didn't understand that."
        self.menu
        self.start
      end
    end
    
    def self.menu 
      puts "for more information on a destination, type the destination number"
      puts "to see the next 5 destinations, type next"
      puts "to see the previous 5 destinations, type back"
      puts "to go to a randomly assigned destination, type gtfo"
      puts "or else type exit" 
    end
    
    def self.print
      self.all[@@navigation..@@navigation + 4].each.with_index(@@navigation + 1) {|d, i| puts "#{i}. #{d.name}"}
    end
    
    def self.destination_details 
      
    end
    
    binding.pry
  end
end


