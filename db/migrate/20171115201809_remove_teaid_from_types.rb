class RemoveTeaidFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :tea_id
  end
end
