class Message < ActiveRecord::Base
  has_many :messages_users
  has_many :users, :through => :messages_users
  belongs_to :user
  after_save :notify_housemates

  def notify_housemates
    user = User.find(self.user_id)
    housemates = User.where(house_id: user.house_id)
    housemates.each { |mate| MessagesUser.find_or_create_by(message_id: self.id, user_id: mate.id)}
    MessagesUser.find_by(message_id: self.id, user_id: user.id).update(read: true) #Better way to integrate into above method
  end
end
