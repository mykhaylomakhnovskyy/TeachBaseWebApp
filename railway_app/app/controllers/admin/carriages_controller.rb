class Admin::CarriagesController < Admin::BaseController
  before_action :set_train, only: %i[new create]

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to admin_train_path(@train)
    else
      render :new
    end
  end

  def destroy
    @carriage = Carriage.find(params[:id])
    @carriage.destroy
    redirect_to admin_trains_url, notice: 'Carriage was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :upper_places_amount,
                                     :down_places_amount, :side_upper_places_amount,
                                     :side_down_places_amount, :seating_places_amount)
  end
end
