class AddColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :user_id, :integer, after: :budget
  end
end
