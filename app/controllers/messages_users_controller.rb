class MessagesUsersController < SecuredController

  def update
    debugger
    messages_users = MessagesUser.find_by(id: params[:id], user_id: current_user.id)
    messages_users.update(view_params)
  end

  private
  def view_params
    params.require(:view).permit(:removed, :read, :message_id)
  end

end


__END__
message id: 1
user viewing: 2
message view id: 2
