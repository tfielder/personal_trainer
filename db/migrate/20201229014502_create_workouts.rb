class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.date :date
      t.date :start_time
      t.date :end_time
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
