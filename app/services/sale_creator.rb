class SaleCreator
  def initialize(params)
    @sale = Sale.new(params)
  end

  def create
    save
  end

  def self.create(params)
    new(params).create
  end

  private

  attr_reader :params, :sale

  def set_vehicle_to_sold
    sale.vehicle.status = :sold if sale.vehicle
  end

  def save
    set_vehicle_to_sold
    sale.save
    sale
  end
end
