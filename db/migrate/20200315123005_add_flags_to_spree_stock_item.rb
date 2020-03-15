class AddFlagsToSpreeStockItem < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_stock_items, :flags, :integer, default: 0
  end
end
