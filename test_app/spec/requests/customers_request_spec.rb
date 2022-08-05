require "rails_helper"

RSpec.describe "Customers", type: :request do
  it "respond sucessfully" do
    get "/customers"
    expect(response).to have_http_status(200)
  end
end
