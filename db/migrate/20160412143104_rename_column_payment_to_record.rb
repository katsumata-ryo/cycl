class RenameColumnPaymentToRecord < ActiveRecord::Migration
  def change
    rename_column :records, :payment, :money
  end
end
