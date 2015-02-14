class Message < ActiveRecord::Base
  has_many :messages_users
  has_many :users, :through => :messages_users
end
