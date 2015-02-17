class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      ## User Info
      t.string  :name
      t.string  :first_name
      t.string  :nickname
      t.string  :image
      t.string  :email
      t.integer :house_id
      t.string  :google_id
      t.string  :venmo_token

      t.timestamps
    end
  end
end
