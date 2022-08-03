require "rails_helper"

RSpec.describe Customer, type: :model do
  it "#full_name - Sobrescrevendo Atributos" do
    customer = create(:customer, name: "Danniel")
    expect(customer.full_name).to eq("Sr. Danniel")
  end

  it "#Herança -Vip" do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it "# Herança - Default" do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it "#full_name- usando aliases" do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it "Usando o attributes_for" do
    attrs = attributes_for(:customer)
    customer = Customer.new(attrs)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it "Atributo Transitorio" do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
