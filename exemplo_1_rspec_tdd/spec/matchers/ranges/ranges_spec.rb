describe (1..5), "Matcher de Ranges" do
  context "Matcher para Ranges" do
    it "#cover" do
      expect(subject).to cover(2)
      expect(subject).to cover(2, 5)
      expect(subject).not_to cover(-1, 6)
    end

    #One-liner syntax (descrição implicitas)
    it { is_expected.to cover(2) }
    it { is_expected.to cover(2, 5) }
    it { is_expected.not_to cover(0, 6) }

    it { expect(subject).to cover(2) }
  end
end
