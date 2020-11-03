class CampersController < ApplicationController
  before_action :set_camper, only: [:show]
  
  def index
    @campers = Camper.all
  end

  def show
    render :show
  end

  def new
    @camper = Camper.new
    render :new
  end

  def create
    @camper = Camper.new(camper_params)
    
    if @camper.valid?
      @camper = Camper.create(camper_params)
      redirect_to camper_path(@camper)
    else
      redirect_to new_camper_path
    end
  end

  private

  def set_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params
    params.require(:camper).permit(:name, :age)
  end

end
