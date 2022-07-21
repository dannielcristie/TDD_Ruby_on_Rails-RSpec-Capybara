require "calculator"

describe Calculator, "Matcher  de Error" do
  context "#div" do
    it "divide by 0, erro generico" do
      expect { subject.div(3, 0) }.to raise_error
    end

    it "divide by 0, passando o tipo de erro" do
      expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError)
    end

    it "divide by 0, passando a messagem do erro" do
      expect { subject.div(3, 0) }.to raise_error("divided by 0")
    end

    it "divide by 0, passando o tipo e a messagem do erro " do
      #   expect { subject.div(3, 0) }.to raise_error
      expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError, "divided by 0")
      expect { subject.div(3, 0) }.to raise_error(/divided/)
    end
    it "divide by 0, usando regex" do
      #   expect { subject.div(3, 0) }.to raise_error
      expect { subject.div(3, 0) }.to raise_error(/divided/)
    end
  end
end
