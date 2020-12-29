module HelpFeatures
  def help_features(input)
    if input == "help"
      puts "The folowing commands are available --
      load <filename>
      find <attribute> <criteria>
      queue count
      queue clear
      queue print
      queue print by <attribute>
      queue save to <filename.csv>
      queue export html <filename.csv>
      help
      help <command>\n\n"
    end

    if input.include?("load")
      puts "-- Load will show/load you a whole file --\n\n"
    elsif input.include?("find")
      puts "-- Find will help you locate specific info, related to tht attribute and criteria you search for --\n\n"
    elsif input.include?("queue count")
      puts "-- This will return the amount of attendees in your queue --\n\n"
    elsif input.include?("queue clear")
      puts "-- This will clear your queue --\n\n"
    elsif input.include?("queue print")
      puts "-- This will print your queue --\n\n"
    elsif input.include?("queue print by")
      puts "-- This will print your queue by the criteria input --\n\n"
    elsif input.include?("queue save to")
      puts "-- This will save your queue to a CS .--\n\n"
    elsif input.include?("queue export html")
      puts "-- This will export your queue to html --\n\n"
    elsif input.include?("queue export html")
      puts "-- This will export your queue to html --\n\n"
    end
  end
end
