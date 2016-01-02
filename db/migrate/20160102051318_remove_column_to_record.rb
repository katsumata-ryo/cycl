class RemoveColumnToRecord < ActiveRecord::Migration
  def change
    remove_column :records, :category, :string
  end
end
