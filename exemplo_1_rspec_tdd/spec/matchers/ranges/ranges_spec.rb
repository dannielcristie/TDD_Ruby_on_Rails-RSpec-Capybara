describe (1..5), "Matcher de Ranges" do
  context "Matcher para Ranges" do
    it "#cover" do
      expect(subject).to cover(2)
      expect(subject).to cover(2, 5)
      expect(subject).not_to cover(-1,6)
    end
  end
end
