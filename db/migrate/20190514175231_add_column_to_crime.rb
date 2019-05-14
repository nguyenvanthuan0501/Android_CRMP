class AddColumnToCrime < ActiveRecord::Migration[5.2]
  def change
    add_column :crimes, :report, :integer
  end
end
