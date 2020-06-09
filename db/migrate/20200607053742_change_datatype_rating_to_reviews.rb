class ChangeDatatypeRatingToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rating, :float, null: false ,default: 0
  end
end
