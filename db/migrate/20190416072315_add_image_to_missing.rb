class AddImageToMissing < ActiveRecord::Migration[5.2]
  def change
    add_column :missings, :image, :string
  end
end
