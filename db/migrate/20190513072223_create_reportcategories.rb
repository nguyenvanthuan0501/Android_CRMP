class CreateReportcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :reportcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
