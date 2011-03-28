# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Promotion do
  before do
    @prod1 = Product.new("Sample", 100)
    @prod2 = Product.new("Sample2", 123)
    @li1 = LineItem.new(@prod1)
    @li2 = LineItem.new(@prod2)
    @li2.increment
    @prom = Promotion.new(@prod1)
  end

  it "should initialize" do
    @prom.should_not be_nil
  end

  it "should have zero discount price when nothing is set" do
    @prom.discount_price_in_pence(@li1).should == 0
  end

  it "should set quantity" do
    @prom.for_quantity(12)
    @prom.quantity.should == 12
  end

  it "should set for_price_of_quantity" do
    @prom.get_free(2)
    @prom.for_price_of_quantity.should == 2
  end

  it "should set for_price_in_pence" do
    @prom.buy_for(300)
    @prom.for_price_in_pence.should == 300
  end

  it "should have buy one get one free promotion" do
    prod = Product.new("Sample2", 123)
    li = LineItem.new(prod, 2)
    prom = Promotion.new(prod).for_quantity(2).get_free(1)
    prom.discount_price_in_pence(li).should == prod.price_in_pence
  end

  it "should get 1 product free when you buy 5 items, with promotion buy 3 for price of 2" do
    prod = Product.new("Sample2", 123)
    li = LineItem.new(prod, 5)
    prom = Promotion.new(prod).for_quantity(3).get_free(1)
    prom.discount_price_in_pence(li).should == prod.price_in_pence
  end

  it "should get 2 product free when you buy 7 items, with promotion buy 3 for price of 2" do
    prod = Product.new("Sample2", 123)
    li = LineItem.new(prod, 7)
    prom = Promotion.new(prod).for_quantity(3).get_free(1)
    prom.discount_price_in_pence(li).should == prod.price_in_pence * 2
  end

  it "should be able to buy 2 items for £2" do
    prod = Product.new("Sample2", 123)
    li = LineItem.new(prod, 2)
    prom = Promotion.new(prod).for_quantity(2).buy_for(200)
    prom.discount_price_in_pence(li).should == (123 * 2) - 200
  end

  it "should be get discount of 92p when buying 4 items, with promotion buy 2 for £2" do
    prod = Product.new("Sample2", 123)
    li = LineItem.new(prod, 4)
    prom = Promotion.new(prod).for_quantity(2).buy_for(200)
    prom.discount_price_in_pence(li).should == (123 * 4) - 400
  end

  it "should be get discount of 92p when buying 5 items, with promotion buy 2 for £2" do
    prod = Product.new("Sample2", 123)
    li = LineItem.new(prod, 5)
    prom = Promotion.new(prod).for_quantity(2).buy_for(200)
    prom.discount_price_in_pence(li).should == (123 * 4) - 400
  end

end
