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
    it "responds a 200 response" do
      member = create(:member)
      customer = create(:customer)

      sign_in member

      get "/customers/", params: { id: customer.id }
      expect(response).to have_http_status(200)
    end

    it "render a :show template" do
      member = create(:member)
      customer = create(:customer)

      sign_in member

      get "/customers/"
      expect(response).to render_template(:index)
    end
  end
end
