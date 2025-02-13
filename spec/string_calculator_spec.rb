require './lib/string_calculator.rb'


describe StringCalculator do

  context "Given two digits" do 
    it "add the digits" do
      calculator = StringCalculator.new
      digitsum = calculator.add(1,2)
      expect(digitsum).to eql(3)
    end

    it "add other digits" do
      calculator = StringCalculator.new
      digitsum = calculator.add(4,5)
      expect(digitsum).to eql(9)
    end

    it "should raise the exception for negative values" do
      calculator = StringCalculator.new
      expect { calculator.add("-2,-3,1")}.to raise_exception {|exct| exct.message.should eql "negative numbers not allowed -2, -3" }
    end

     it "For delimeter like //;\n1;2 should return 3" do
      calculator = StringCalculator.new
      calculator.add("//;\n1;2").should eql 3
    end
  end


end