class Promotion

  attr_reader :product, :quantity, :for_price_of_quantity, :for_price

  def initialize(prod)
    @product = prod
  end

  def for_quantity(q)
    @quantity = q
    self
  end

  def get_free(no_of_items)
    @for_price_of_quantity = no_of_items
    @for_price = nil
    self
  end

  def buy_for(price)
    @for_price_of_quantity = nil
    @for_price = price
    self
  end

  def discount_price_in_pence(line_item)
    if for_price_of_quantity
      puts "I'm first"
      puts "((#{quantity} + #{for_price_of_quantity}) / #{line_item.quantity}) * #{product.price_in_pence}: #{((quantity + for_price_of_quantity) / line_item.quantity) * product.price_in_pence}"
      ((quantity + for_price_of_quantity) / line_item.quantity) * product.price_in_pence
    elsif for_price
      puts "I'm here"
      puts "(#{line_item.quantity} / #{quantity}): #{(line_item.quantity / quantity)}"
      (line_item.quantity / quantity).times.inject(0) do |sum, x|
        puts "inside"
        puts "((#{product.price_in_pence} * #{quantity}) - #{for_price}): #{((product.price_in_pence * quantity) - for_price)}"
        sum + ((product.price_in_pence * quantity) - for_price)
      end
    end.to_i
  end
end