class MessagesUsersController < SecuredController

  def update
    messages_users = MessagesUser.find_by(id: params[:id], user_id: current_user.id)
    messages_users.update(params) #This is incomplete, should update this to change a specific users view (i.e. message read, deleted...etc)
  end

end
