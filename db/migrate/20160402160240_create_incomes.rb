class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :income, null: false
      t.date :date, null: false
      t.text :memo
      t.integer :category_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
