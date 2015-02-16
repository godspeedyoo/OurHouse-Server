class User < ActiveRecord::Base

  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  belongs_to :house
  has_many :messages
  has_many :messages_users
  # has_many :messages, :through => :messages_users
  has_many :payments, class_name: 'Payment', foreign_key: 'payer_id'

end
