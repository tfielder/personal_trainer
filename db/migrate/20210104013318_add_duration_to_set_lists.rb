class AddDurationToSetLists < ActiveRecord::Migration[6.1]
  def change
    add_column :setlists, :duration, :string
  end
end
