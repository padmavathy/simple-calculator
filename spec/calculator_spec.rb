require_relative '../calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number for a single number" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum of two numbers" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "returns the sum for multiple numbers" do
    expect(calculator.add("1,2,3,4")).to eq(10)
  end

  it "handles newlines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "supports custom multiple delimiters" do
    expect(calculator.add("//;\n1;2;3#4,5^,&*")).to eq(15)
  end

  it "raises an error for a single negative number" do
    expect { calculator.add("-1") }.to raise_error("Error: negative numbers not allowed: -1")
  end

  it "raises an error for multiple negative numbers" do
    expect { calculator.add("2,-4,3,-5") }.to raise_error("Error: negative numbers not allowed: -4,-5")
  end
end

