require "pessoa"

describe "Matcher de Atributos de classe" do
  context "Atributos de classe" do
    it "have_attributes" do
      pessoa = Pessoa.new
      pessoa.nome = "Danniel"
      pessoa.idade = 15

      expect(pessoa).to have_attributes(
        nome: starting_with("D"),
        idade: (be >= 20),
      )
    end
  end
end
