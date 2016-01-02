class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :monthly
      t.integer :budget

      t.timestamps null: false
    end
  end
end
