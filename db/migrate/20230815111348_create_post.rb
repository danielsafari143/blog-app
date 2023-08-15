class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
