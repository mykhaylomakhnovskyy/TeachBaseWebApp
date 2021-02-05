class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  before_validation  :set_number

  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :sleeper, -> { where(type: 'SleeperCarriage') }
  scope :seater, -> { where(type: 'SeaterCarriage') }

  default_scope { order(number: :asc) }
  scope :desc, -> { reorder(number: :desc) }
  protected

  def set_number
    self.number = rand(100)
  end
end
