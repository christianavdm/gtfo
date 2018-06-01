require "gtfo/version"
require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'pry'

module Gtfo
  class Scraper 
    def get_page(url)
      doc = Nokogiri::HTML(open("http://www.travelandleisure.com/trip-ideas/best-places-to-travel-in-2018")
      binding.pry
    end
  end
end

# hbd-image-caption-pn


