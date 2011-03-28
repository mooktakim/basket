class LineItem
  attr_reader :product, :quantity

  def initialize(prod, q = 1)
    @product = prod
    @quantity = q
  end

  def increment
    @quantity += 1
  end

  def description
    product.name
  end

  def net_price_in_pence
    product.price_in_pence
  end

  def full_price_in_pence
    net_price_in_pence * quantity
  end

  def formatted_net_price
    PriceFormatter.format(net_price_in_pence)
  end

  def formatted_full_price
    PriceFormatter.format(full_price_in_pence)
  end

  def to_s
    "#{description} x#{quantity}"
  end
end
