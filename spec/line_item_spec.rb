# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe LineItem do
  before do
    @product = Product.new("Sample", 100)
    @line_item = LineItem.new(@product, 2)
  end

  it "should initialize" do
    @line_item.should_not be_nil
  end

  it "should have product" do
    @line_item.product.should eql(@product)
  end

  it "should have quantity" do
    @line_item.quantity.should == 2
  end

  it "should have description" do
    @line_item.description.should == "Sample"
  end

  it "should have net price" do
    @line_item.net_price_in_pence.should == 100
  end

  it "should have formatted net price" do
    @line_item.formatted_net_price.should == "£1.00"
  end

  it "should have full price" do
    @line_item.full_price_in_pence.should == 200
  end

  it "should have formatted full price" do
    @line_item.formatted_full_price.should == "£2.00"
  end

  it "should be able to increment quanity" do
    @line_item.quantity.should == 2
    @line_item.increment
    @line_item.quantity.should == 3
  end

  it "should print description of line item" do
    @line_item.to_s.should == "Sample x2"
  end
end
