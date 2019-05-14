class AddColumnToMissing < ActiveRecord::Migration[5.2]
  def change
    add_column :missings, :report, :integer
  end
end
