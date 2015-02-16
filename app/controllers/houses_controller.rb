class HousesController < ApplicationController

  def index
    # houses = House.all
    # render json: houses
  end

  def show
    house = House.find_by(id: 1) #Change '1' to current_user.house_id in production
    render json: house
  end

  def create
    house = House.new(name: params[:name])

    if house.save
      current_user.update(house_id: house.id) #will only work when auth/current user is working
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
