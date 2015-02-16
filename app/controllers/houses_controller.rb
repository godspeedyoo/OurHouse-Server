class HousesController < ApplicationController #SecuredController

  def index
    # houses = House.all
    # render json: houses
  end

  def show
    render json: House.find(params[:id])
  end

  def create
    house = House.new(params[:house])
    if house.save
      current_user.update(house_id: house.id)
      render json: house
    else
      render json: {message: 'House not created'}, status: 403
    end
  end

  def update
    house = House.find(params[:id])
    house.update(name: params[:name]) #might add other updates at some point
    render json: house
  end

  def destroy

  end

end
