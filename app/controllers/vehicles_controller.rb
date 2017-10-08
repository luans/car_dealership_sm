class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update]

  has_scope :by_query

  respond_to :json, only: :index

  def index
    @vehicles = apply_scopes(Vehicle).all
    @vehicles = @vehicles.where(license_plate: params[:license_plate]) if params[:license_plate]
    respond_with @vehicles
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = CreateVehicle.create(vehicle_params)
    respond_with @vehicle
  end

  def show
  end

  def edit
  end

  def update
    @vehicle.update(vehicle_params)
    respond_with @vehicle
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(
      :brand, :version, :maker_year, :model_year, :license_plate, :city,
      :uf, :color, :fuel, :renavam, :chassi, :owner, :old_license_plate)
  end
end
