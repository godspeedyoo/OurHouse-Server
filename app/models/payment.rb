class Payment < ActiveRecord::Base
  belongs_to :user
  after_create :add_house_id

  def add_house_id
    self.house_id = User.find(self.payer_id).id
  end
end
