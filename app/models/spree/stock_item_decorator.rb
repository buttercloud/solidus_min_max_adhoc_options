Spree::StockItem.class_eval do
  include FlagShihTzu
  has_flags 1 => :not_available
end
