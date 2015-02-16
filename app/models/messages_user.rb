class MessagesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  default_scope { order('created_at DESC')}
  MessagesUser.includes(:user)

end

