class Basket

  attr_reader :line_items, :promotions

  def initialize
    @line_items = []
    @promotions = []
  end

  def add(prod)
    if item = line_items.detect{|l| l.product == prod}
      item.increment
    else
      @line_items << (item = LineItem.new(prod))
    end
  end

  def full_price_in_pence
    line_items.inject(0){|sum, l| sum + l.full_price_in_pence} - discount_in_pence
  end

  def formatted_full_price
    PriceFormatter.format(full_price_in_pence)
  end

  def add_promotion(prom)
    if promotions.detect{|p| p.product == prom.product}
      raise "Cannot apply more than one promotion to same product"
    end
    @promotions << prom
  end

  def discount_in_pence
    line_items.inject(0) do |sum, l|
      if prom = promotions.detect{|p| p.product == l.product}
        sum + prom.discount_price_in_pence(l)
      else
        sum
      end
    end
  end

  def formatted_discount
    PriceFormatter.format(discount_in_pence)
  end

  def display_basket
    puts ""
    puts "Shopping Basket:"
    puts "----------------"
    line_items.each do |l|
      puts "#{l} @ #{l.formatted_net_price} -- #{l.formatted_full_price}"
    end
    if discount_in_pence > 0
      puts "----------------"
      puts "Discount: #{formatted_discount}"
    end
    puts "----------------"
    puts "Total: #{formatted_full_price}"
    puts "----------------"
    puts ""
  end

end
