class RenameColumnToOrders < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :adderess_id, :address_id
  end
end
