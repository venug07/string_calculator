require './lib/string_calculator.rb'


describe StringCalculator do

  before :each do
    @calculator = StringCalculator.new
  end

  context "Given two digits" do 
    it "add the digits" do
      digitsum = @calculator.add("1,2")
      expect(digitsum).to eql(3)
    end

    it "add other digits" do
      digitsum = @calculator.add("4,5")
      expect(digitsum).to eql(9)
    end

    it "should raise the exception for negative values" do
      expect { @calculator.add("-2,-3,1")}.to raise_exception {|exp| exp.message.should eql "Negative numbers not allowed -2, -3" }
    end

    it "For delimeter like //;\n1;2 should return 3" do
      @calculator.add("//;\n1;2").should eql 3
    end

    it "should return same value if there is only single value in string" do
      digitsum = @calculator.add("5")
      digitsum.should eql 5
    end

    it "should return 0 if string is empty" do
      digitsum = @calculator.add("")
      digitsum.should eql 0
    end

    it "should return the correct output for multiple delimeters" do
      digitsum = @calculator.add("//[***][---]\n1***6***7---3")
      digitsum.should eql 17
    end

    it "should return the correct output for new line between numbers" do
      digitsum = @calculator.add("1\n2,3")
      digitsum.should eql 6
    end

    it "should throw exception for alphabets" do
      expect { @calculator.add("a,b,3")}.to raise_exception {|exp| exp.message.should eql "Alphabets not allowed a, b" }
    end
  end


end