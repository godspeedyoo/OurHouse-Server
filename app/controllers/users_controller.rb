class UsersController < SecuredController

  def index
    users = User.all
    render json: users
    # return render json: @user, status 200
    # status codes are important
    # write specific messages for errors
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
