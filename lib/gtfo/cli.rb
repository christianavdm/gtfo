class Gtfo::CLI 
  
  def initialize 
    @input = nil
    @max = nil
    @navigation = 0
  end
  
  def self.navigation 
    @navigation 
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
    puts  " "
    puts  "                                                    | "
    puts  "              _  _                                \\ _ / "
    puts  "             ( `   )_                           -= (_) =- "
    puts  "            (    )    `)                          /   \\ "
    puts  "          (_   (_ .  _) _)                          | "
    puts  " "
    puts  "                                     _"
    puts  "                                   -=\\`\\ "
    puts  "                               |\\ ____\\_\\__"
    puts  "                             -=\\c`\"\"\"\"\"\"\" \"`)"
    puts  "                                `~~~~~/ /~~` "
    puts  "       time to gtfo               -==/ / "
    puts  "                                    '-'            _ "
    puts  "                                                  (  )"
    puts  "                     _, _ .                    ( `  ) . )"
    puts  "                    ( (  _ )_                 (_, _(  ,_)_)"
    puts " "
    puts " " 
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "    to go to a randomly assigned destination, type gtfo"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "       to see the top 5 travel destinations, type go" 
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts " "
    Gtfo::Destination.new.destinations_from_page 
    start
  end
  
  def start
    @input = gets.strip
    @max = Gtfo::Destination.all.count
    if @input.downcase == "go"
      @navigation = 0 
      print
      start
    elsif @input.downcase == "next" 
      @navigation += 5 unless @navigation >= (@max - 5)
      print
      start
    elsif @input.downcase == "back"
      @navigation -= 5 unless @navigation <= 0
      print 
      start
    elsif @input.downcase == "gtfo"
      gtfo
      start
    elsif @input.to_i > 0 && @input.to_i <= @max
      destination_details
      start
    elsif @input.downcase == "exit" 
      bon_voyage
    elsif @input == "?"
      menu
      start
    else 
      puts ""
      puts "I didn't understand that."
      menu
      start
    end
  end
  
  def menu 
    puts ""
    puts "*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *"
    puts "                Command Options"
    puts "*                                               *"
    puts "  gtfo => go to a randomly assigned destination "
    puts "* go   => go to the top 5 destinations          *"
    puts "  next => to see the next 5 destinations"
    puts "* back => to see the previous 5 destinations    *"
    puts ""
    puts "*    for more information on a destination,     *"
    puts "            type the destination number"
    puts "*               or else type exit               *" 
    puts ""
    puts "*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *"
    puts ""
  end
  
  def print
    puts " "
    puts "* * * * * Now Boarding * * * * * "
    puts " "
    Gtfo::Destination.all[@navigation..@navigation + 4].each.with_index(@navigation + 1) {|d, i| puts "  #{i}. #{d.name}"}
    puts " "
    puts " "
    puts "for menu options, type ?"
    puts ""
  end
  
  def destination_details 
    index = @input.to_i - 1 
    destination = Gtfo::Destination.all[index]
    print_details(destination)
  end
  
  def gtfo 
    r = Random.new 
    index = r.rand(0..49)
    destination = Gtfo::Destination.all[index]
    print_details(destination)
  end
  
  def print_details(destination)
    puts ""
    puts ""
    puts "********* #{destination.name} *********"
    puts ""
    puts ""
    puts destination.description
    puts ""
    puts "*************************"
    puts ""
    puts "for menu options, type ?"
    puts ""
  end
  
  def bon_voyage 
    puts " "
    puts " "
    puts "         ,====,,\'\'\'\',,,           "
    puts "  _______||__||_______ \'\'\',     _________________ "
    puts " | ___|_|_____ | |    |    ;   /                 | "
    puts " | |HONG KONG| | |    |   ;   / o  Bon Voyage!   | "
    puts " |    | |      |_|___ |    \'\'\'\\                  | "
    puts " | ___|_|_____ ||USA| |       \`\\_________________| "
    puts " | |SINGAPORE| | |    |         "
    puts " |____|_|______|_|____| "
    puts " "
    puts " "     
    exit
  end
  
end