# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# Shopping Basket Application
# ===========================
#
# We would like you to write a small application to the following requirements
# written in either Rails or just plain Ruby. We would like it to be tested using
# whatever framework you are comfortable with. It must pass the tests and the
# tests must include at least the requirements mentioned below. If anything is
# ambiguous just make an assumption and add a test for it. This is not meant to
# take days to complete. A UI is not required.
#
# We have a number of products:
# An orange is 29p
# Bread is £1
# Milk is 90p
# Shower gel is £1.19
#
# We have some deals:
# * We'd like to do a 3 for the price of 2 deal on oranges.
# * You can buy 2 Shower gels for £2
#
# A customer walks into a shop and picks up an orange, bread and milk, takes it
# to the checkout and the assistant scans the items and displays a total.
#
# A customer picks up 3 oranges and a bottle of milk, takes it to the checkout and
# the assistant scans the items and displays a total.
#
# Another customer picks up 1 orange and a loaf of bread, takes it to the checkout
# and the assistant scans the items and displays a total.
#
# Our final customer picks up 2 shower gels and 3 oranges takes it to the checkout
# and the assistant scans the items and displays a total.

describe Basket do
  before do
    @basket = Basket.new
  end
  #
  # it "should initialize" do
  #   @basket.should_not be_nil
  # end
  #
  # it "should have no line items" do
  #   @basket.line_items.should be_empty
  # end
  #
  # it "should be able to add one product" do
  #   prod = Product.new("Blah", 250)
  #   @basket.add(prod)
  #   @basket.line_items.size.should == 1
  #   @basket.line_items.first.product.should == prod
  #   @basket.line_items.first.quantity.should == 1
  # end
  #
  # it "should be able to add two different products" do
  #   @basket.add(Product.new("Blah", 250))
  #   @basket.add(Product.new("Blah 2", 450))
  #   @basket.line_items.size.should == 2
  #   @basket.line_items.each do |l|
  #     l.quantity.should == 1
  #   end
  # end
  #
  # it "should have quanity=2 when same two products are added" do
  #   prod = Product.new("Blah", 250)
  #   @basket.add(prod)
  #   @basket.add(prod)
  #   @basket.line_items.size.should == 1
  #   @basket.line_items.first.quantity.should == 2
  # end
  #
  # it "should have correct full price when two different products are added" do
  #   @basket.add(Product.new("Blah", 250))
  #   @basket.add(Product.new("Blah 2", 450))
  #   @basket.full_price_in_pence.should == 700
  # end
  #
  # it "should have correct formatted full price when two different products are added" do
  #   @basket.add(Product.new("Blah", 250))
  #   @basket.add(Product.new("Blah 2", 450))
  #   @basket.formatted_full_price.should == "£7.00"
  # end
  #
  # it "should have correct full price when same product is added twice" do
  #   p = Product.new("Blah", 250)
  #   @basket.add(p)
  #   @basket.add(p)
  #   @basket.full_price_in_pence.should == 500
  # end
  #
  # it "should have correct formatted full price when same product is added twice" do
  #   p = Product.new("Blah", 250)
  #   @basket.add(p)
  #   @basket.add(p)
  #   @basket.formatted_full_price.should == "£5.00"
  # end
  #
  # it "should have correct full price when same product is added twice and a different product is added" do
  #   p = Product.new("Blah", 250)
  #   @basket.add(p)
  #   @basket.add(p)
  #   @basket.add(Product.new("Blah 3", 870))
  #   @basket.full_price_in_pence.should == 1370
  # end
  #
  # it "should have correct formatted full price when same product is added twice and a different product is added" do
  #   p = Product.new("Blah", 50)
  #   @basket.add(p)
  #   @basket.add(p)
  #   @basket.add(Product.new("Blah 3", 870))
  #   @basket.formatted_full_price.should == "£9.70"
  # end
  #
  # context "with promotions" do
  #   before do
  #     @orange = Product.new("Orange", 29)
  #     @bread = Product.new("Bread", 100)
  #     @milk = Product.new("Milk", 90)
  #     @gel = Product.new("Shower gel", 119)
  #   end
  #
  #   it "should raise exception when more than one promotion added to same product" do
  #     prom = Promotion.new(@orange).for_quantity(3).get_free(1)
  #
  #     lambda {
  #       @basket.apply_promotion(prom)
  #     }.should raise_error
  #   end
  #
  #   it "should discount 1 orange if 3 oranges added" do
  #     prom = Promotion.new(@orange).for_quantity(3).get_free(1)
  #     @basket.add_promotion(prom)
  #     @basket.add(@orange)
  #     @basket.add(@orange)
  #     @basket.add(@orange)
  #     @basket.discount_in_pence.should == 29
  #     @basket.full_price_in_pence.should == @orange.price_in_pence*2
  #   end
  #
  #   it "should be that 3 Shower gel cost £2" do
  #     prom = Promotion.new(@gel).for_quantity(3).buy_for(200)
  #     @basket.add_promotion(prom)
  #     @basket.add(@gel)
  #     @basket.add(@gel)
  #     @basket.add(@gel)
  #     @basket.discount_in_pence.should == (@gel.price_in_pence*3 - 200)
  #     @basket.full_price_in_pence.should == 200
  #   end
  #
  # end

  context "PureSolo specs" do
    before do
      # We have some deals:
      # * We'd like to do a 3 for the price of 2 deal on oranges.
      # * You can buy 2 Shower gels for £2
      #
      # A customer walks into a shop and picks up an orange, bread and milk, takes it
      # to the checkout and the assistant scans the items and displays a total.
      #
      # A customer picks up 3 oranges and a bottle of milk, takes it to the checkout and
      # the assistant scans the items and displays a total.
      #
      # Another customer picks up 1 orange and a loaf of bread, takes it to the checkout
      # and the assistant scans the items and displays a total.
      #
      # Our final customer picks up 2 shower gels and 3 oranges takes it to the checkout
      # and the assistant scans the items and displays a total.@orange = Product.new("Orange", 29)
      @orange = Product.new("Orange", 29)
      @bread = Product.new("Bread", 100)
      @milk = Product.new("Milk", 90)
      @gel = Product.new("Shower gel", 119)
      prom1 = Promotion.new(@orange).for_quantity(3).get_free(1)
      prom2 = Promotion.new(@gel).for_quantity(2).buy_for(200)
      @basket.add_promotion(prom1)
      @basket.add_promotion(prom2)
    end

    it "should create correct shopping basket for 1x orange, 1x bread and 1x milk" do
      @basket.add(@orange)
      @basket.add(@bread)
      @basket.add(@milk)
      @basket.display_basket
      @basket.line_items.size.should == 3
      @basket.line_items.each do |l|
        l.quantity.should == 1
      end
      @basket.discount_in_pence.should == 0
    end
  end
end