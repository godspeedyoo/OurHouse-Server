class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.belongs_to :house
      t.string :message_type
      t.text :content
      t.timestamps null: false
    end
  end
end


# JSON data for creating a message

