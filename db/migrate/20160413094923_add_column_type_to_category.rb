class AddColumnTypeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :payment, :boolean, default: true, null: false
  end
end
