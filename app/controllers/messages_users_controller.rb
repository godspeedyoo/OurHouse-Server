class MessagesUsersController < ApplicationController

  def update
    messages_users = MessagesUser.find_by(id: params[:id], user_id: 1) #replace 1 with current_user.id in production
    messages_users.update(params) #figure this shit out
  end

end
