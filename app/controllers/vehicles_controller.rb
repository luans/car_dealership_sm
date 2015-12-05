class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update]

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      flash[:notice] = 'Vehicle created successful'
      redirect_to @vehicle
    else
      flash[:alert] = "Vehicle can't be saved"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      flash[:notice] = 'Vehicle update successful'
      redirect_to @vehicle
    else
      flash[:alert] = "Vehicle can't be updated"
      render :edit
    end
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
