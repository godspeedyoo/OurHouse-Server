class UsersController < ApplicationController #SecuredController

  def index
    render json: User.where(house_id: current_user.house_id)
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create

  end

  def update

  end

  def destroy

  end

end
