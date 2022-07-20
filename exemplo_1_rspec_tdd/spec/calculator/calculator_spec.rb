require "calculator"

describe Calculator do
  context "#sum" do # '#' para indicar metodo de instancia
    it "positive numbers" do
      result = subject.sum(5, 7)
      expect(result).to eq(12)
    end

    it "negative and positive numbers" do
      result = subject.sum(-5, 7)
      expect(result).to eq(2)
    end

    it "negative numbers" do
      result = subject.sum(-5, -7)
      expect(result).to eq(-12)
    end
  end
end
