class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: %i[destroy show]

  def show
    @train = Train.find(@ticket.train_id)
  end

  def new
    @ticket = current_user.tickets.new
    params[:train_ids].split(' ').map(&:to_i).each do |train_id|
      @trains ||= []
      @trains << Train.find(train_id)
    end
    @trains
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def index
    @tickets = current_user.tickets.all
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:id, :train_id, :name, :surname, :passport_id)
  end
end
