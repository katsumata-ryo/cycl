class AddColumnToRecord < ActiveRecord::Migration
  def change
    add_column :records, :user_id, :integer, after: :category_id
  end
end
