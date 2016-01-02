class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :year
      t.integer :money
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
