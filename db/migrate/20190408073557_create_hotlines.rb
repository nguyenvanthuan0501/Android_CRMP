class CreateHotlines < ActiveRecord::Migration[5.2]
  def change
    create_table :hotlines do |t|
      t.string :area
      t.string :hotline_number

      t.timestamps
    end
  end
end
