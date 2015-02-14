class HousesController < ApplicationController::API
    
  def index
    @house = House.all
    respond_to do |format|
      format.json { render json: @house }
    end
  end

  def show
    @house = House.find(params[:id])
    respond_to do |format|
      format.json { render json: @house }
    end
  end

  def  
    
  end


end
