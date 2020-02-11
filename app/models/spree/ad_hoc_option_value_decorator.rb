Spree::AdHocOptionValue.class_eval do
  after_destroy -> { ad_hoc_option_type.refresh_rule_value }
end