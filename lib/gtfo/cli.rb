module Gtfo 
end

class Gtfo::CLI 
  
  @@navigation = 0 
  
  def initialize 
    @input = nil
  end
  
  def self.navigation 
    @@navigation 
  end
  
  def call 
    puts  "              _  _"
    puts  "             ( `   )_"
    puts  "            (    )    `)"
    puts  "          (_   (_ .  _) _)"
    puts  "                                         _"
    puts  "                                        (  )"
    puts  "         _ .                         ( `  ) . )"
    puts  "       (  _ )_                      (_, _(  ,_)_)"
    puts  "     (_  _(_ ,)"
    puts  "                                                            |"
    puts "                                                     | "
    puts  "              _  _                                \ _ / "
    puts  "             ( `   )_                           -= (_) =- "
    puts "              (    )    `)                         /   \ "
    puts  "          (_   (_ .  _) _)                          | "
    puts " "
    puts  "                                     _"
    puts  "                                   -=\`\ "
    puts  "                               |\ ____\_\__"
    puts  "                             -=|c`""""""" "`)"
    puts  "                                `~~~~~/ /~~` "
    puts  "       time to gtfo               -==/ / "
    puts  "                                    '-'            _ "
    puts  "                                                  (  )"
    puts  "                     _, _ .                    ( `  ) . )"
    puts  "                    ( (  _ )_                 (_, _(  ,_)_)"
    puts " "
    puts " " 
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "to go to a randomly assigned destination, type gtfo"
    puts "to see the top 5 travel destinations, type go" 
    start
  end
  
  def start
    Gtfo::Destination.new.destinations_from_page
    @input = gets.strip
    if @input.downcase == "go"
      @@navigation = 0 
      print
      start
      return nil
    elsif @input.downcase == "next" 
      @@navigation += 5 unless @@navigation >= 44
      print
      start
      return nil
    elsif @input.downcase == "back"
      @@navigation -= 5 unless @@navigation <= 0
      print 
      start
      return nil
    elsif @input.downcase == "gtfo"
      gtfo
      start
      return nil
    elsif @input.to_i > 0 && @input.to_i < 51
      destination_details
      start
      return nil
    elsif @input.downcase == "exit" 
      puts "Bon voyage!"
      exit
    elsif @input == "?"
      menu
      start
      return nil
    else 
      puts "I didn't understand that."
      menu
      start
      return nil
    end
  end
  
  def menu 
    puts "for more information on a destination, type the destination number"
    puts "to see the next 5 destinations, type next"
    puts "to see the previous 5 destinations, type back"
    puts "to go to a randomly assigned destination, type gtfo"
    puts "to go to the top 5 destinations, type go"
    puts "or else type exit" 
  end
  
  def print
    Gtfo::Destination.all[@@navigation..@@navigation + 4].each.with_index(@@navigation + 1) {|d, i| puts "#{i}. #{d.name}"}
    puts "for menu options, type ?"
  end
  
  def destination_details 
    index = @input.to_i - 1 
    destination = Gtfo::Destination.all[index]
    puts destination.name 
    puts destination.description
    puts "for menu options, type ?"
  end
  
  def gtfo 
    r = Random.new 
    index = r.rand(0..49)
    destination = Gtfo::Destination.all[index]
    puts destination.name 
    puts destination.description
    puts "for menu options, type ?"
  end
  
end