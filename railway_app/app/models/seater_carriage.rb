class SeaterCarriage < Carriage
  validates :seating_places_amount, presence: true
end
