class StringCalculator


 def add(string_numbers)
    neg_values = []
    @stringnumbers = string_numbers.split(',')
    @stringnumbers.each do |sn|
      neg_values << sn.to_i if sn.to_i < 0
    end
    if neg_values.empty?
       true
    else
      raise Exception.new "Negative numbers not allowed " + neg_values.join(", ")
    end
 end

end