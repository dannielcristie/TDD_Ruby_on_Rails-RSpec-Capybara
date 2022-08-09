require "rails_helper"

RSpec.describe "Customers", type: :request do
  describe "As a guest" do
    it "respond 302 response  (not authorized)     " do
      customer = create(:customer)
      get "/customers/show", params: { id: customer.id }
      expect(response).to have_http_status(302)
    end

    it "respond a 200 response (sucessfully)" do
      get "/customers"
      expect(response).to have_http_status(200)
    end
  end

  describe "As logged Member" do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it "with valid attributes" do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect {
        post "/customers", params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it "responds a 200 response" do
      sign_in @member

      get "/customers/", params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it "render a :show template" do
      sign_in @member

      get "/customers/"
      expect(response).to render_template(:index)
    end
  end
end
