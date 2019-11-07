require 'rails_helper'

describe "New paper page", type: :feature do

  it "should render withour error" do
    visit new_paper_path
  end

  it "should fail validation without all attributes" do
    paper = Paper.new()
    expect(paper).to_not be_valid 
  end

  it "should fail validation with string in year attribute" do
    paper = Paper.new(:title => 'HPI', :venue => 'Potsdam', :year => 'nineteen-fifty')
    expect(paper).to_not be_valid 
  end

end