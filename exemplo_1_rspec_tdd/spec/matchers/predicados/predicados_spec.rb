describe "Matcher Predicados" do
  context "Predicado" do
    it "odd" do
      expect(1).to be_odd
    end

    it "even" do
      expect(2).to be_even
    end

    it "positive" do
      expect(2).to be_positive
    end
  end
end
