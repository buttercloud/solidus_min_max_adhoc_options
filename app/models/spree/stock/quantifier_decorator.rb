Spree::Stock::Quantifier.class_eval do
  def availablility
    stock_items.any?(&:availablility)
  end

  def can_supply?(required)
    (total_on_hand >= required || backorderable?) && availablility?
  end
end
