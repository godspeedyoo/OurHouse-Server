class Payment < ActiveRecord::Base
  belongs_to :user
  after_create :add_house_id

  def add_house_id
    user = User.find(self.user_id)
    self.house_id = user.house_id
  end

end
