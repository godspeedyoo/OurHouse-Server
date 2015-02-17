class HousesController < SecuredController

  def index
    # houses = House.all
    # render json: houses
  end

  def show
    render json: House.find(params[:id])
  end

  def create
    house = House.new(house_params)
    if house.save
      User.find(params[:user_id]).update(house_id: house.id)
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

  private
  def house_params
    params.require(:house).permit(:name)
  end
end