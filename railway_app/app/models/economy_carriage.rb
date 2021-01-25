class EconomyCarriage < Carriage
  validates :down_places_amount, :upper_places_amount,
            :side_down_places_amount, :side_upper_places_amount, presence: true
end
