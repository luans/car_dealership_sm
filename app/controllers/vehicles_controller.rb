class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update]

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
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
      :uf, :color, :fuel, :renavam, :chassi, :owner, :old_license_plate, :status)
  end
end
