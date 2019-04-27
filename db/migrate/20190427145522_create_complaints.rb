class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :title
      t.string :content
      t.string :image
      t.belongs_to :complaint_categories, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
