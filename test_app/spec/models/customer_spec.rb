require "rails_helper"

RSpec.describe Customer, type: :model do
  fixtures :all

  it "Create a Customer" do
    customer = customers(:danniel)

    expect(customer.full_name).to eq("Sr. Danniel Cristie")
  end
end
    