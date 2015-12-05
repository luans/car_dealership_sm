class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:notice] = 'Customer created successful'
      redirect_to @customer
    else
      flash[:alert] = "Customer can't be created"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = 'Customer updated successful'
      redirect_to @customer
    else
      flash[:alert] = "Customer can't be updated"
      render :edit
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:full_name, :cpf, :birth_date, :rg, :rg_sender, :rg_expedition,
      :place_birth, :place_birth_uf, :nacionality, :mother, :father, :postal_code, :address,
      :neighborhood, :adjunct, :city, :state, :phone, :cell_phone, :email)
  end
end

