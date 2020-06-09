class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :content
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
      t.index [:user_id, :post_id], unique: true
    end
  end
end
