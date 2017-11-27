class AddRatingsToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :rating, :integer
  end
end
