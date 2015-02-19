class MessagesUsersController < SecuredController

  def update
    messages_users = MessagesUser.find_by(id: params[:id], user_id: current_user.id)
    messages_users.update(view_params)
  end

  private
  def view_params
    params.require(:view).permit(:removed, :read, :message_id)
  end

end