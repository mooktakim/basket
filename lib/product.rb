# encoding: UTF-8
class Product
  attr_reader :price_in_pence, :name
  def initialize(n, p)
    @name = n
    @price_in_pence = p
  end
end