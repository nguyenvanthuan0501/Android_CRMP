class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.boolean :status
      t.integer :post_id
      t.belongs_to :reportcategory, index: true
      # t.belongs_to :crime, index: true
      # t.belongs_to :missing, index: true

      t.timestamps
    end
  end
end
