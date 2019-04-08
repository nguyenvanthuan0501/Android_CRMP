class CreateMissings < ActiveRecord::Migration[5.2]
  def change
    create_table :missings do |t|
      t.string :title
      t.string :description
      t.string :phone_number
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
