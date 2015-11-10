class VehiclesController < ApplicationController
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
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :brand, :version, :maker_year, :model_year, :license_plate, :city,
      :uf, :color, :fuel, :renavam, :chassi, :owner, :old_license_plate, :status)
  end
end
