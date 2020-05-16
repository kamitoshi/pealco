class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :menu_name
      t.text :content
      t.string :image
      t.references :user, foreign_key: true
      t.references :alc_category, foreign_key: true
      t.references :menu_category, foreign_key: true

      t.timestamps
    end

    add_index :posts, :title
    add_index :posts, :menu_name
  end
end
