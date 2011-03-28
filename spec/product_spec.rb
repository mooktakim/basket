# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Product do
  before do
    @product = Product.new("Sample", 100)
  end

  it "should initialize" do
    @product.should_not be_nil
  end

  it "should have name" do
    @product.name.should == "Sample"
  end

  it "should have price" do
    @product.price_in_pence.should == 100
  end
end
