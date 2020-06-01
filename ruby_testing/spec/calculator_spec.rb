require './lib/calculator' 

describe Calculator do
    calculator = Calculator.new
    describe "#add" do
      it "returns the sum of two numbers" do
        # calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
      end
      describe "#multiply" do
        it "returns the product of two numbers" do
            # calculator = Calculator.new
            expect(calculator.multiply(5, 2)).to eql(10)
          end
      end
    end
end