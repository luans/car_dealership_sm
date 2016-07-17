class CreateVehicle
  def self.create(params)
    Vehicle.create(params) do |vehicle|
      vehicle.status = :stock
    end
  end
end
