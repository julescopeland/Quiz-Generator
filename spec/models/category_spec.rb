require 'spec_helper'

describe Category do
  before(:each) do
    @attr = {
      :name => "general knowledge",
      :description => "a little bit of everything"
    }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@attr)
  end
  
  it "should be invalid without a name" do
    category = Category.new(@attr.merge(:name => ""))
    category.should_not be_valid
  end
end
