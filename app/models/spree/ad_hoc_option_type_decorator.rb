Spree::AdHocOptionType.class_eval do
  AD_HOC_OPTION_TYPE_RULE_TYPES = { "Min of": "min", "Max of": "max", "Exact number of": "exact", "None": nil }.freeze
  AD_HOC_OPTION_TYPE_RULE_VALUES = 1..100.freeze

  validates :rule_type, inclusion: { in: AD_HOC_OPTION_TYPE_RULE_TYPES.values, message: "%{value} is not allowed. Allowed values are #{AD_HOC_OPTION_TYPE_RULE_TYPES.values}" }, allow_blank: true
  validates :rule_value, inclusion: { in: AD_HOC_OPTION_TYPE_RULE_VALUES, message: "%{value} is not allowed. Allowed values are #{AD_HOC_OPTION_TYPE_RULE_VALUES}" }, if: -> { rule_type.present? }

  validate  :max_rule_value_validation, if: -> { rule_type.present? && rule_value.present? }

  def min_max_error_friendly_message
    "Please select #{AD_HOC_OPTION_TYPE_RULE_TYPES.invert[rule_type]} #{rule_value} values for option #{self.presentation}"
  end

  def max_rule_value_validation
    errors.add(:rule_value, "Should be less or equal to number of options #{ad_hoc_option_values.count}") if rule_value > ad_hoc_option_values.count
    errors.blank?
  end

  def refresh_rule_value
    if rule_value.present?
      self.update_column(:rule_value, ad_hoc_option_values.count) if rule_value > ad_hoc_option_values.count
    end
  end

  def valid_min_max?(ah_ovs)
    if rule_type.present?
      case rule_type
      when "min"
        ah_ovs.count >= rule_value
      when "max"
        ah_ovs.count <= rule_value
      when "exact"
        ah_ovs.count == rule_value
      else
        false
      end
    else
      true
    end
  end
end
