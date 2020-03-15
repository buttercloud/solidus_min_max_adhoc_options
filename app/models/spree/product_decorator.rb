Spree::Product.class_eval do
  def available?
    (!(available_on.nil? || available_on.future?) && !deleted?) && !stock_items.any?(&:not_available)
  end
end
