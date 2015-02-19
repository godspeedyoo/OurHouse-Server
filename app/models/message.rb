class Message < ActiveRecord::Base
  has_many :messages_users
  belongs_to :user
  belongs_to :house
  before_create :add_house_id
  after_save :notify_housemates
  Message.includes(:messages_user)

  def add_house_id
    user = User.find(self.user_id)
    self.house_id = user.house_id
  end

  def notify_housemates
    user = User.find(self.user_id)
    housemates = User.where(house_id: user.house_id)
    housemates.each { |mate| MessagesUser.find_or_create_by(message_id: self.id, user_id: mate.id)}
    MessagesUser.find_by(message_id: self.id, user_id: user.id).update(read: true)
  end
end
