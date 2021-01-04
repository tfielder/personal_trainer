class CreateSetlists < ActiveRecord::Migration[6.1]
  def change
    create_table :setlists do |t|
      t.string :type
      t.float :reps
      t.float :weight
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
