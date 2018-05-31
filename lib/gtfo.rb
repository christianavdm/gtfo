require "gtfo/version"
require 'nokogiri'
require 'open-uri'
require 'pry'

module Gtfo
  class Scraper 
    def get_page(url)
      Nokogiri::HTML(open("url"))
    end
  end
end
