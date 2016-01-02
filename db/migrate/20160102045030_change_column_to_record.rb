class ChangeColumnToRecord < ActiveRecord::Migration
  def up
    add_column :records, :category_id, :integer
  end

  def down
    remove_column :records, :category, :string
  end
end
