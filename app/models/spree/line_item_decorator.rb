Spree::LineItem.class_eval do
  validate :min_max_number_of_adhoc_options, if: -> { quantity > 0 }

  def min_max_number_of_adhoc_options
    ad_hoc_option_values.group_by{|a| a.ad_hoc_option_type_id }.each do |ad_ot_id, ad_ot_values|
      if ah_ot = Spree::AdHocOptionType.find_by(id: ad_ot_id)
        if !ah_ot.valid_min_max?(ad_ot_values)
          errors.add(:base, ah_ot.min_max_error_friendly_message)
        end
      else
        errors.add(:base, "Invalid AdHocOptionType id: #{ad_ot_id}")
      end
    end

    errors.blank?
  end
end
