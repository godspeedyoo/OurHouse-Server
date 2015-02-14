class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.string :type
      t.text :content
      t.timestamps null: false
    end
  end
end
