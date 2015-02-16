class MessagesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  MessagesUser.includes(:message)
  default_scope { order('created_at DESC')}

end

