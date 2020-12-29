module CleanerMethods
  def attribute_make_string_downcase(attribute)
    attribute.to_s.downcase
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  # def clean_homephone_only_numeric(homephone)
  #   # require "pry"; binding.pry
  #   homephone.to_i.digits.reverse.select do |character|
  #     character.to_s if !character.nil?
  #   end.join
  # end

  # def clean_homephone(homephone)
  #   # require "pry"; binding.pry
  #   if clean_homephone_only_numeric(homephone).to_i == Numeric
  #     if homephone.length == 10
  #       puts "Home Phone: #{homephone}"
  #     elsif homephone.length == 11 && homephone[0] == "1"
  #       puts "Home Phone: #{homephone[1..10]}"
  #     else
  #       puts "Home Phone: 0000000000"
  #     end
  #   end
  # end
end
