class Vehicle < ActiveRecord::Base
  STATUS = {
    :stock => I18n.t('stock', scope: 'enumerize.vehicle.status'),
    :sold => I18n.t('sold', scope: 'enumerize.vehicle.status')
  }

  def status
    I18n.t(read_attribute(:status), scope: 'enumerize.vehicle.status').capitalize
  end
end
