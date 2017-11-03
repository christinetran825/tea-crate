class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type_name
      t.string :origin
      t.string :leaves
      t.string :caffeine
      t.string :pairing
      t.string :brew_time
      t.string :tasting_notes
      t.string :brand
      t.string :comments
      t.integer :tea_id
    end
  end
end
