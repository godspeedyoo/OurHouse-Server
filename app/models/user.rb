class User < ActiveRecord::Base
  belongs_to :house
  has_many :messages
  has_many :messages_users
  has_many :payments, class_name: 'Payment', foreign_key: 'payer_id'
end
