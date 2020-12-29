class Repl

  def initialize
  end

  def repl_start
    puts "-- Welcome to the Event Reporter. The folowing commands are available -- \n
    load <filename>, find <attribute> <criteria>, queue count, queue clear, queue print,
    queue print by <attribute>, queue save to <filename.csv>, queue export html <filename.csv>,
    help, help <command>, to exit, type exit."

    input = gets.downcase.strip

    if input == "exit"
      puts "You have chosen exit, goodbye."
      exit
    end

    puts "You have chosen #{input}, is that correct?
      Please type a response, Y/N."

    yes_no1 = gets.downcase.strip

    puts "\n\n"

    if yes_no1 == "n"
      p "Would you like to try again, Y/N ?"
      yes_no2 = gets.downcase.strip
      if yes_no2 == "n"
        exit
      else
        repl_start
      end
    elsif input.include?("help")
      help_features(input)
    elsif input.include?("queue")
      queue_features(input)
    elsif input.include?("load")
      load_csv(input.split[1])
    elsif input.include?("find")
      find_attribute_by_criteria(input.split[1].to_sym, input.split[2..-1].join(" ").to_s)
    end
    repl_start
  end
end
