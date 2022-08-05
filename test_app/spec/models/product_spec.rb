require "rails_helper"

RSpec.describe Product, type: :model do
  it "is valid with description, price  and category" do
    product = create(:product)
    expect(product).to be_valid
  end

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:category) }

  it "returns full description" do
    product = create(:product)
    expect(product.full_description).to eq "#{product.description} - #{product.price}"
  end
end
