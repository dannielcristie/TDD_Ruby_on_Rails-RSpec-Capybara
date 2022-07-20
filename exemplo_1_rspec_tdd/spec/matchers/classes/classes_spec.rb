require "string_nao_vazia"

describe "Matchers de Classes" do
  context "Classes" do
    it "be-instance_of" do
      expect(10).to be_instance_of(Integer) # exatamente a classe
    end

    it "be_kind_of" do
      str = StringNaoVazia.new

      expect(str).to be_kind_of(String)
      expect(str).to be_kind_of(StringNaoVazia)
      expect(10).to be_kind_of(Integer) # pode ser por herança
    end

    it "be_an / be_a" do
      str = StringNaoVazia.new

      expect(str).to be_an(String)
      expect(str).to be_an(StringNaoVazia)

      expect(str).to be_a(String)
      expect(str).to be_a(StringNaoVazia)
    end
    it "respond_to" do
      expect("ruby").to respond_to(:size)
      expect("ruby").to  respond_to(:count)
    end
  end
end
