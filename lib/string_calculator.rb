class StringCalculator


 def add(string_numbers="")
    sepval = [","]
    if string_numbers =~ /^\/\/.*/
      seprtnum = string_numbers.split("//")[1].split("\n")[0]
      sepval = seprtnum.split("][").map { |v| v.gsub("[",""); }
      sepval.map! { |v| v.gsub("]",""); }
    end
    if string_numbers =~ /^\/\/.*/
      string_numbers = string_numbers.split("\n")[1]
    else
      string_numbers = string_numbers.gsub "\n" , sepval[0]
    end
    sepval.each { |seprt| string_numbers = string_numbers.gsub seprt, ","}
    @stringnumbers = string_numbers.split ","
    neg_values = []
    if !@stringnumbers.empty?
      @stringnumbers.each do |sn|
        neg_values << sn.to_i if sn.to_i < 0
      end
      if neg_values.empty?
       if @stringnumbers.length > 1
        @stringnumbers = @stringnumbers.inject {|acu, v| acu.to_i + v.to_i }
       else
        @stringnumbers.first.to_i
       end
      else
       raise Exception.new "Negative numbers not allowed " + neg_values.join(", ")
      end
    else
      return 0
    end
 end

end