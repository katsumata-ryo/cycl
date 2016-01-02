class RemoveColumnToUser < ActiveRecord::Migration
  def change
    remove_column :users, :salary_day, :integer
  end
end
