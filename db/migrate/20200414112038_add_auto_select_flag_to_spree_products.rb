class AddAutoSelectFlagToSpreeProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_products, :auto_select_flag, :boolean
  end
end
