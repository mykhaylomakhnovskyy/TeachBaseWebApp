class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  after_create :send_buying_notification
  before_destroy :send_destroying_notification

  private

  def send_buying_notification
    TicketsMailer.buy_ticket(self.user,self).deliver_now
  end

  def send_destroying_notification
    TicketsMailer.destroy_ticket(self.user,self).deliver_now
  end
end
