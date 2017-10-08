class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  respond_to :json, only: :index

  has_scope :by_query

  def index
    @customers = apply_scopes(Customer).all
    @customers = Customer.where(cpf: params[:cpf]) if params[:cpf]
    respond_with @customers
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    respond_with @customer
  end

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    respond_with @customer
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

