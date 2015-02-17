class MessagesController < SecuredController
  # include /users/:user_id/houses/:house_id/messagesMessagesViewsHelper
  include MessagesViewsHelper

  def index
    messages = Message.where(user_id: params[:user_id])
    render json: message_views(messages, User.find(params[:user_id]))
  end

  def show
    render json: Message.find(params[:id])
  end

  def create
    message = Message.new(params[:message]) #must include type & content
    message.update(user_id: current_user.id, house_id: current_user.house_id)
    if message.save
      render json: message
    else
      render json: { message: 'Message not created' }, status: 403
    end
  end

  # def update
  # end

  # def destroy

  # end

end
