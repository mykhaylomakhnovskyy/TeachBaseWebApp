class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def count_places(carriage_type, *places_types)
    places_counter = 0
    carriages.each do |carriage|
      next unless carriage.type == carriage_type

      places_types.each do |place_type|
        places_counter += carriage.method("#{place_type}".to_sym).call
      end
    end
    places_counter
  end
end
