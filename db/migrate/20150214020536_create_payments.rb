class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :receiver_id
      t.integer :payer_id
      t.integer :amount
      t.string :description
      t.boolean :fufilled
      t.timestamps
    end
  end
end
