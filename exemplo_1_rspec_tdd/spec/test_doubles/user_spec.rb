describe "Teste Double" do
  it "--" do
    user = double("User")
    allow(user).to receive_messages(nome: "Danniel", password: "secret")
    puts user.nome
    puts user.password
  end

  it "as_null_object" do
    user = double("User").as_null_object
    allow(user).to receive_messages(nome: "Danniel", password: "secret")
    puts user.nome
    puts user.password
    user.abc
  end
end
