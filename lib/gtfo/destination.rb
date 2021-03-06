class Gtfo::Destination 
  attr_accessor :name, :description
  
  @@all = []  
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self
  end
  
  def destinations_from_page
    doc = Nokogiri::HTML(open("https://www.travelandleisure.com/trip-ideas/best-places-to-travel-in-2018"))
    
    doc.css(".media-body").each do |destination|
      new_destination = Gtfo::Destination.new 
      new_destination.name = destination.css("h2").text.strip
      new_destination.description = destination.css("p").text
      new_destination.save unless new_destination.name == "The 50 Best Places to Travel in 2018" || new_destination.name == ""
    end
  end
end


