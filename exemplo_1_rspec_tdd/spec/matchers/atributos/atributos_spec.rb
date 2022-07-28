require "pessoa"

describe "Matcher de Atributos de classe" do
  context "Atributos de classe" do
    before(:each) do
      @pessoa = Pessoa.new
      p ">>>> Instanciando objeto <<<<<"
    end

    after(:each) do
      @pessoa.nome = "Sem nome!"
      p ">>>>>> #{@pessoa.nome} <<<<<<<<"
    end

    it "have_attributes I " do
      @pessoa.nome = "Danniel"
      @pessoa.idade = 25

      expect(@pessoa).to have_attributes(
        nome: starting_with("D"),
        idade: (be >= 20),
      )
    end

    it "have_attributes II" do
      @pessoa.nome = "Daniel"
      @pessoa.idade = 35

      expect(@pessoa).to have_attributes(
        nome: starting_with("D"),
        idade: (be >= 20),
      )
    end
  end
end
