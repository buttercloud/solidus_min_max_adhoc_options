class AddRuleTypeAndValueToSpreeAdhocOptionType < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_ad_hoc_option_types, :rule_type, :string
    add_column :spree_ad_hoc_option_types, :rule_value, :integer
  end
end
