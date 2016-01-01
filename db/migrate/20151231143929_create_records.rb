class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :payment
      t.date :date
      t.string :category
      t.boolean :card
      t.text :memo

      t.timestamps null: false
    end
  end
end
