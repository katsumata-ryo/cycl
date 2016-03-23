class DropTableSalaryDates < ActiveRecord::Migration
  def change
    drop_table :salary_dates
  end
end
