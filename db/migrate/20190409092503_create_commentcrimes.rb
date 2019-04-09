class CreateCommentcrimes < ActiveRecord::Migration[5.2]
  def change
    create_table :commentcrimes do |t|
      t.string :content
      t.belongs_to :user, index: true
      t.belongs_to :crime, index: true

      t.timestamps
    end
  end
end
