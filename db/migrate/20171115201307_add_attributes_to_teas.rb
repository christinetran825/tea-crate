class AddAttributesToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :origin, :string
    add_column :teas, :leaves, :string
    add_column :teas, :caffeine, :string
    add_column :teas, :pairing, :string
    add_column :teas, :brew_time, :string
    add_column :teas, :tasting_notes, :string
    add_column :teas, :comments, :string
  end
end
