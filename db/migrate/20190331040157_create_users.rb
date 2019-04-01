class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :password
      t.string :email
      t.string :phone_number
      t.string :address
      t.integer :id_card_number

      t.timestamps
    end
  end
end
