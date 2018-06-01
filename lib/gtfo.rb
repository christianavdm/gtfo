require "gtfo/version"
require 'nokogiri'
require 'open-uri'
require 'pry'

module Gtfo
  class Scraper 
    def get_page(url)
      page = Nokogiri::HTML(open("https://www.nationalgeographic.com/travel/features/best-trips-destinations-2018/"))
      binding.pry
    end
  end
end


