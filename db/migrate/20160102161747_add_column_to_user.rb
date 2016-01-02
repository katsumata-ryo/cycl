class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :salary_day, :integer
  end
end
