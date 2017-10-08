class Sale < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :seller, class_name: 'Customer'
  belongs_to :purchaser, class_name: 'Customer'

  scope :by_query, ->(query) do
    joins(:vehicle, :seller, :purchaser).
    where("upper(vehicles.license_plate) = :upcased_query
      OR upper(vehicles.chassi) = :upcased_query
      OR vehicles.renavam = :query
      OR customers.full_name ILIKE :query_like
      OR customers.cpf = :query
      OR purchasers_sales.full_name ILIKE :query_like
      OR purchasers_sales.cpf = :query",
      query: query,
      query_like: "%#{query}%",
      upcased_query: query.to_s.upcase
    )
  end

  validates_presence_of :vehicle, :seller, :sale_price, :sale_date, :purchaser, :purchase_price, :purchase_date
  validates_inclusion_of :brokerage, in: [true, false], message: :invalid
  validates_numericality_of :incoming_invoice_number, :output_invoice_number, only_integer: true, allow_blank: true
  validates_numericality_of :output_invoice_number,
                            other_than: ->(sale){ sale.incoming_invoice_number.to_i },
                            message: :cannot_be_equal_to_incoming_invoice_number,
                            allow_blank: true

  validates :sale_date, date: { allow_nil: true }
  validates :sale_date, date: {
            after_or_equal_to: :purchase_date,
            message: :greater_than_or_equal_to_purchase_date,
            allow_nil: true }
  validates :incoming_invoice_date, date: { allow_nil: true }
  validates :output_invoice_date, date: {
            after_or_equal_to: :incoming_invoice_date,
            message: :greater_than_or_equal_to_incoming_invoice_date,
            allow_nil: true}
  validates :sale_date, :purchase_date, :incoming_invoice_date, :output_invoice_date,
            date: { before: Proc.new { Date.tomorrow }, message: :not_in_the_future, allow_nil: true }

  accepts_nested_attributes_for :vehicle, :seller, :purchaser, limit: 1, update_only: true
end
