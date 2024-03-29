require "rails_helper"

feature "Customers", type: :feature do
  scenario "Verifica Link Cadastro de Cliente" do
    visit(root_path)
    expect(page).to have_link("Cadastro de Clientes")
  end

  scenario "Verifica Link de Novo Cliente" do
    visit(root_path)
    click_on("Cadastro de Clientes")
    expect(page).to have_content("Listando Clientes")
    expect(page).to have_link("Novo Cliente")
  end

  scenario "Verifica Formulário de Novo Cliente" do
    visit(customers_path)
    click_on("Novo Cliente")
    expect(page).to have_content("Novo Cliente")
  end
  scenario "Cadastra um cliente valido" do
    visit(new_customer_path)
    customer_name = Faker::Name.name

    fill_in("Nome", with: customer_name)
    fill_in("Email", with: Faker::Internet.email)
    fill_in("Telefone", with: Faker::PhoneNumber.phone_number)
    attach_file("Foto do Perfil", "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ["S", "N"].sample)
    click_on("Criar Cliente")

    expect(page).to have_content("Cliente cadastrado com sucesso!")
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario "Não Cadastra um cliente invalido" do
    visit(new_customer_path)
    click_on("Criar Cliente")
    expect(page).to have_content("não pode ficar em branco")
  end

  scenario "Mostrar um cliente" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  scenario "Mostrar a index" do
    customer1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )
    customer2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
  end

  scenario "Atualizar um cliente" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )
    new_name = Faker::Name.name
    visit(edit_customer_path (customer.id))
    fill_in("Nome", with: new_name)

    click_on("Atualizar Cliente")

    expect(page).to have_content("Cliente atualizado com sucesso!")
    expect(page).to have_content(new_name)
  end

  scenario "Clica no link Mostrar da Index" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )
    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr/td[3]/a").click
    expect(page).to have_content("Mostrando Cliente")
  end

  scenario "Clica no link Editar da Index" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )
    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr/td[5]/a").click
    expect(page).to have_content("Editando Cliente")
  end

  scenario "Apaga um cliente" do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ["S", "N"].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png",
    )
    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr/td[7]/a").click
    expect(page).to have_content("Cliente excluido com sucesso!")
  end
end
