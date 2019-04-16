class AddImageToCrimes < ActiveRecord::Migration[5.2]
  def change
    add_column :crimes, :image, :string
  end
end
