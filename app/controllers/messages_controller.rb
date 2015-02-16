class MessagesController < SecuredController

  def index
    messages = Message.where(house_id: 1) #change to current user in production
    render json: messages
  end

# /users/:user_id/houses/:house_id/messages/:id(.:format)

  def show
    message = Message.find(params[:id])
    render json: message
  end

  def create
    # assumes that client side is going to send
    # the user_id and house_id inside params
    # so there is no inference of ownership of user/house in back end
    message = Message.new(params[:message])

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
