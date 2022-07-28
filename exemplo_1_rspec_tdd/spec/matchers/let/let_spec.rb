$counter = 0
describe "let" do
  context "Teste usando let" do
    let(:count) { $counter += 1 }
    it "memorizar o valor" do
      expect(count).to eq(1) # carregado pela 1a vez
      expect(count).to eq(1) # 2a fica em cache
    end

    it "não cacheado entre os testes" do
      expect(count).to eq(2)
      expect(count).to eq(2)
    end
  end
end
