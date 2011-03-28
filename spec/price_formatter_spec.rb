# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe PriceFormatter do

  it "should format pounds" do
    PriceFormatter.format(100).should == "£1.00"
    PriceFormatter.format(150).should == "£1.50"
  end

  it "should format pence" do
    0.upto(99) do |p|
      PriceFormatter.format(p).should == "#{p}p"
    end
  end
end
