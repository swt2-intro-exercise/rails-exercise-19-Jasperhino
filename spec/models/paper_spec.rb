require 'rails_helper'

RSpec.describe Paper, type: :model do
  paper = Paper.new(:title => 'HPI', :venue => 'Potsdam', :year => 1999)

  it "should fail validation without all attributes" do
    paper = Paper.new()
    expect(paper).to_not be_valid 
  end

  it "should fail validation with string in year attribute" do
    paper = Paper.new(:title => 'HPI', :venue => 'Potsdam', :year => 'nineteen-fifty')
    expect(paper).to_not be_valid 
  end

  it "should have empty authors list" do
    expect(paper.authors.count).to eq(0)  
  end
end
