require 'CSV'
require './lib/cleaner_methods_module'
require './lib/repl'
require './lib/help_features_module'

class EventReporter < Repl
  include CleanerMethods
  include HelpFeatures

  def initialize
    @queue = []
    @id_tracker = []
    @id_hash_queue = []
  end

  def queue_features(input)
    if input.include?("queue count")
      puts "\n--------\nThe Queue count is #{@queue.count}\n--------\n\n"
    elsif input.include?("queue clear")
      @queue.clear
    elsif input[0..1] == "queue print"
      puts @queue
    elsif input.include?("queue print by")
      attribute = input.split[3]
      print_by = @queue.sort_by do |row|
        row[attribute]
      end
      puts print_by
      puts "\n-- Here are your people, sorted by #{attribute} -- \n\n\n"
    elsif input.include?("queue save to")
      filename_csv = input.split[3]
      CSV.open(filename_csv, 'wb') do |csv|
        csv << ["last_name", "first_name", "email_address", "zipcode", "city", "state", "street", "homephone"]
        csv << @queue.map(&:values)
        puts "\n-- You have succesfully created #{filename_csv} -- \n\n\n"
      end
    elsif input.include?("queue export html")

    end
  end

  def find_attribute_by_criteria(attribute, criteria, filename = 'full_event_attendees.csv')
    contents = CSV.open filename, headers: true, header_converters: :symbol
    nil_counter = 0
    counter = 0

    contents.each do |row|
      # require "pry"; binding.pry
      id            = row[:id]
      regdate       = row[:regdate]
      first_name    = attribute_make_string_downcase(row[:first_name])
      last_name     = attribute_make_string_downcase(row[:last_name])
      email_address = attribute_make_string_downcase(row[:email_address])
      homephone     = row[:homephone]
      # homephone     = clean_homephone(row[:homephone])
      # homephone     = clean_homephone_only_numeric(row[:homephone])
      street        = attribute_make_string_downcase(row[:street])
      city          = attribute_make_string_downcase(row[:city])
      state         = attribute_make_string_downcase(row[:state])
      zipcode       = clean_zipcode(row[:zipcode])
      full_name = (first_name + " " + last_name)

      if row[attribute].nil?
        nil_counter += 1
      else
        if row[attribute].downcase == criteria
          puts "\n Name: #{full_name.split.map(&:capitalize).join(' ')} - Registration ID: #{id} - Registration Date: #{regdate} \n email: #{email_address} - Home Phone: #{homephone} - Address: #{street.split.map(&:capitalize).join(' ')}, #{city.split.map(&:capitalize).join(' ')}, #{state.upcase}, #{zipcode} \n \n ------------------------------------------------------------------------------------------"
          counter += 1
          @queue << [["last_name", last_name], ["first_name", first_name], ["email_address", email_address], ["zipcode", zipcode], ["city", city], ["state", state], ["street", street], ["homephone", homephone]].to_h
          # @queue << [["Last Name", last_name], ["First Name", first_name], ["e-mail Address", email_address], ["Zipcode", zipcode], ["City", city], ["State", state], ["Street", street], ["Home Phone", homephone]].to_h
          @id_tracker << id
          # @queue <<  "#{last_name} #{first_name} #{email_address} #{zipcode} #{city} #{state} #{street} #{homephone}"
        end
      end
    end
    puts "\n #{counter} #{attribute}'s matching #{criteria}, #{nil_counter} #{attribute}'s came back nil \n \n --------------------------------------------------------------------------------------"
  end

  def load_csv(filename = 'full_event_attendees.csv')
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      id            = row[:id]
      regdate       = row[:regdate]
      first_name    = attribute_make_string_downcase(row[:first_name])
      last_name     = attribute_make_string_downcase(row[:last_name])
      email_address = attribute_make_string_downcase(row[:email_address])
      homephone     = row[:homephone]
      # homephone     = clean_homephone(row[:homephone])
      # homephone     = clean_homephone_only_numeric(row[:homephone])
      street        = attribute_make_string_downcase(row[:street])
      city          = attribute_make_string_downcase(row[:city])
      state         = attribute_make_string_downcase(row[:state])
      zipcode       = clean_zipcode(row[:zipcode])
      full_name = (first_name + " " + last_name)

      puts "#{full_name} -- #{id} #{regdate} #{email_address} #{homephone} #{street} #{city} #{state} #{zipcode}"
    end
  end
end
