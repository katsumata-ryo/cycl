class AddColumnToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :enable, :boolean
  end
end
