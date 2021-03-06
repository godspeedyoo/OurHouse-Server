class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer    :receiver_id
      t.integer    :payer_id
      t.integer    :amount
      t.integer    :house_id
      t.string     :description
      t.boolean    :fulfilled

      t.timestamps
    end
  end
end
