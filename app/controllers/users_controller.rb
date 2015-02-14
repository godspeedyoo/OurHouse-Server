class UsersController < ApplicationController::API
  include ActionController::MimeResponds

  def index
    @user = User.all
    respond_to do |format|
      format.json { render json: @user }
    end

    # return render json: @user, status 200
    # status codes are important
    # write specific messages for errors
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def edit
    
  end

  def destroy
    
  end

end