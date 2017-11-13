class CreateTea < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.string :tea_name
      t.string :brand
      t.integer :user_id
    end
  end
end
