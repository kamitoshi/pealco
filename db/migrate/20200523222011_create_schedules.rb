class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :content
      t.datetime :start_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
