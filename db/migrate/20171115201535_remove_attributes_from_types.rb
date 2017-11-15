class RemoveAttributesFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :origin
    remove_column :types, :leaves
    remove_column :types, :caffeine
    remove_column :types, :pairing
    remove_column :types, :brew_time
    remove_column :types, :tasting_notes
    remove_column :types, :comments
  end
end