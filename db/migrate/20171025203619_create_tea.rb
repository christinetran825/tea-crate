class CreateTea < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.string :name
      t.string :type
      t.string :origin
      t.integer :user_id
    end
  end
end
