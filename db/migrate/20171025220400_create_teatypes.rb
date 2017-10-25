class CreateTeaTypes < ActiveRecord::Migration
  def change
    create_table :tea_types do |t|
      t.integer :tea_id
      t.integer :type_id
    end
  end
end
