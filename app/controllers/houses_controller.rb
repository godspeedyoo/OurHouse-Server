class HousesController < ApplicationController

  def index
    # houses = House.all
    # render json: houses
  end

  def show
    house = House.find(params[:id])
    render json: house
  end

  def create
    house = House.new(name: params[:name])

    if house.save
      current_user.update(house_id: house.id)
      render json: house
    else
      render json: {message: 'House not created'}, status: 403
    end
  end

  def update
    house = House.find(params[:id])
    house.update(name: params[:name])
    render json: house
  end

  def destroy

  end

end
