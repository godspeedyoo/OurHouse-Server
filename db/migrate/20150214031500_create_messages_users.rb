class CreateMessagesUsers < ActiveRecord::Migration
  def change
    create_table :messages_users do |t|
      t.belongs_to :message, index: true
      t.belongs_to :user, index: true
      t.boolean :read, default: false
      t.boolean :removed, default: false # changed from deleted to removed
      t.timestamps null: false
    end
  end
end
