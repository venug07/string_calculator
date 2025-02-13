require './lib/string_calculator.rb'


describe StringCalculator do 
  context "Given two digits" do 
    it "add the digits" do
      calculator = StringCalculator.new
      digitsum = calculator.add_digits(1,2)
      expect(digitsum).to eql(3)
    end
  end
end