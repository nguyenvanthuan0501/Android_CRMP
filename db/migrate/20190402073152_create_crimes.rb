class CreateCrimes < ActiveRecord::Migration[5.2]
  def change
    create_table :crimes do |t|
      t.string :area
      t.string :title
      t.string :description
      t.datetime :time
      t.belongs_to :users, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
