class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @sale.build_vehicle
    @sale.build_seller
    @sale.build_purchaser
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(sale_params)
    respond_with @sale
  end

  def create
    @sale = SaleCreator.create(sale_params)
    respond_with @sale
  end

  def show
    @sale = Sale.find(params[:id])
  end

  private

  def sale_params
    params.require(:sale).permit(
      :vehicle, :seller, :sale_price, :sale_date, :purchaser, :purchase_price, :purchase_date, :brokerage,
      :incoming_invoice_number, :incoming_invoice_date, :output_invoice_number, :output_invoice_date, :observation,
      vehicle_attributes: [
        :brand, :version, :maker_year, :model_year, :license_plate, :city,
        :uf, :color, :fuel, :renavam, :chassi, :owner, :old_license_plate
      ],
      seller_attributes: customer_attributes,
      purchaser_attributes: customer_attributes
    )
  end

  def customer_attributes
    [
      :full_name, :cpf, :birth_date, :rg, :rg_sender, :rg_expedition,
      :place_birth, :place_birth_uf, :nacionality, :mother, :father, :postal_code, :address,
      :neighborhood, :adjunct, :city, :state, :phone, :cell_phone, :email
    ]
  end
end
