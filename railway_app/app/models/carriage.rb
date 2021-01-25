class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  before_validation  :set_number

  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :sleeper, -> { where(type: 'SleeperCarriage') }
  scope :seater, -> { where(type: 'SeaterCarriage') }
  protected

  def set_number
    self.number = Train.find_by(id == train_id).carriages.last.number + 1
  end
end
