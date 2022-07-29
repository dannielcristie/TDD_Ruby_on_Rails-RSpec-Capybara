describe "Teste Double" do
  it "--" do
    user = double("User")
    allow(user).to receive_messages(nome: "Danniel", password: "secret")
    puts user.nome
    puts user.password
  end
end
