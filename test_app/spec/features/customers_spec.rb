require "rails_helper"
require_relative "../support/new_customer_form"
RSpec.feature "Customers", type: :feature do
  let (:new_customer_form) { NewCustomerForm.new }

  it "Visit index page" do
    visit(customers_path)
    expect(page).to have_current_path(customers_path)
  end

  it "Ajax" do
    visit(customers_path)
    click_link("Add Message")
    expect(page).to have_content("Yes!")
  end

  it "Find" do
    visit(customers_path)
    click_link("Add Message")
    expect(find("#my-div").find("h1")).to have_content("Yes!")
  end

  it "Create a Customer" do
    member = create(:member)
    login_as(member, :scope => :member)

    visit(new_customer_path)

    fill_in("Name", with: Faker::Name.name)
    fill_in("Email", with: Faker::Internet.email)
    fill_in("Address", with: Faker::Address.street_address)

    click_button("Create Customer")

    expect(page).to have_content("Customer was successfully created.")
  end

  it "Create a Customer - Page Object Pattern" do
    new_customer_form.login.visit_page.fill_in_with(
      Name: Faker::Name.name,
      Email: Faker::Internet.email,
      Address: Faker::Address.street_address,
    ).submit
    expect(page).to have_content("Customer was successfully created.")
  end
end
