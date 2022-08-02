require "rails_helper"

RSpec.describe Customer, type: :model do
  it "#full_name - Sobrescrevendo Atributos" do
    customer = create(:customer, name: "Danniel")
    expect(customer.full_name).to eq("Sr. Danniel")
  end

  it "#full_name- usando aliases" do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
