class AddIsPaymentColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :is_payment, :boolean, null: false, default: true
  end
end
