class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'You bought a ticket')
  end

  def destroy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'You canceled your booking')
  end
end
