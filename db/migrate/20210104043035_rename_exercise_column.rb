class RenameExerciseColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :exercises, :type, :exercise_name
  end
end
