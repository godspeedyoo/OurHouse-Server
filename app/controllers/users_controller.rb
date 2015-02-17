class UsersController < SecuredController

  def index
    render json: User.where(house_id: current_user.house_id) if current_user
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    debugger
    user = User.find_or_create_by(google_id: users_google_id)
    user.update(email: params[:email], name: params[:name], first_name: params[:given_name], image: params[:picture]) if user
    render json: user
  end

  def update

  end

  def destroy

  end

end
