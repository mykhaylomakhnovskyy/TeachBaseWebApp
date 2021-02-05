class CoupeCarriage < Carriage
  validates :upper_places_amount, :down_places_amount, presence: true
end
