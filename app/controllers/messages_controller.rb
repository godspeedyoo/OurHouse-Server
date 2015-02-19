class MessagesController < SecuredController
  include MessagesViewsHelper

  def index
    messages = Message.where(house_id: current_user.house_id)
    render json: message_views(messages, current_user)
  end

  def show
    render json: Message.find(params[:id])
  end

  def create
    message = Message.new(message_params) #must include type & content
    message.update(user_id: current_user.id, house_id: current_user.house_id)
    if message.save
      render json: message
    else
      render json: { message: 'Message not created' }, status: 403
    end
  end


  private
  def message_params
    params.require(:message).permit(:content, :type)
  end

end
