class Gtfo::Destination 
  attr_accessor :name, :description
  
  @@all = []  
  
  def self.all 
    @@all 
  end
  
  def destinations_from_page
    doc = Nokogiri::HTML(open("http://www.travelandleisure.com/trip-ideas/best-places-to-travel-in-2018"))
    
    doc.css(".media-body").each do |destination|
      new_destination = Gtfo::Destination.new 
      new_destination.name = destination.css("h2").text.strip
      new_destination.description = destination.css("p").text
      @@all << new_destination unless new_destination.name == "The 50 Best Places to Travel in 2018" || new_destination.name == ""
    end
  end
end


