class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :complaints, :complaint_categories_id, :complaint_category_id
  end
end
