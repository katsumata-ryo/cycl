class AddColumnPaymentToRecord < ActiveRecord::Migration
  def change
    add_column :records, :payment, :boolean, default: true, null: false
  end
end
