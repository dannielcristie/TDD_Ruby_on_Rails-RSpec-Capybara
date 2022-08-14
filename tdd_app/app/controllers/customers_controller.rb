class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: "Cliente cadastrado com sucesso!"
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
  end
end
