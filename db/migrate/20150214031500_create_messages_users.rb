class CreateMessagesUsers < ActiveRecord::Migration
  def change
    create_table :messages_users do |t|
      t.integer :message_id
      t.integer :user_id
      t.boolean :read, default: false
      t.boolean :removed, default: false # changed from deleted to removed
      t.timestamps null: false
    end
  end
end
