class Promotion

  attr_reader :product, :quantity, :for_price_of_quantity, :for_price_in_pence

  def initialize(prod)
    @product = prod
  end

  def for_quantity(q)
    @quantity = q
    self
  end

  def get_free(no_of_items)
    @for_price_of_quantity = no_of_items
    @for_price_in_pence = nil
    self
  end

  def buy_for(price)
    @for_price_of_quantity = nil
    @for_price_in_pence = price
    self
  end

  def discount_price_in_pence(line_item)
    return 0 if quantity.to_i < 1
    return 0 unless line_item.quantity >= quantity

    if for_price_of_quantity
      (line_item.quantity / quantity) * product.price_in_pence
    elsif for_price_in_pence
      no_of_discounts = line_item.quantity / quantity
      actual_price = (product.price_in_pence * quantity) * no_of_discounts
      discount_price = for_price_in_pence * no_of_discounts
      actual_price - discount_price
    end.to_i
  end

end
