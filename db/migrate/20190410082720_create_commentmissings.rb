class CreateCommentmissings < ActiveRecord::Migration[5.2]
  def change
    create_table :commentmissings do |t|
      t.string :content
      t.belongs_to :user, index: true
      t.belongs_to :missing, index: true

      t.timestamps
    end
  end
end
