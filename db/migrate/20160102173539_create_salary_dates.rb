class CreateSalaryDates < ActiveRecord::Migration
  def change
    create_table :salary_dates do |t|
      t.integer :cutoff
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
