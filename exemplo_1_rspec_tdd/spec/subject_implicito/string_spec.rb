require "string_nao_vazia"

describe String, "Testando uma string" do
  describe StringNaoVazia, "Testando uma string vazia"   do
    it "Não esta vazia" do
      expect(subject).to eql("Não sou vazio")
    end
  end
end
