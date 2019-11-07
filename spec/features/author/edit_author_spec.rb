require 'rails_helper'

before(:each) do
    @alan = FactoryBot.create :author
  end

describe "New author page", type: :feature do
  it "should render withour error" do
    visit edit_author_path(@alan)
  end

  it "should edit author" do
    visit edit_author_path(@alan)

    page.fill_in 'author[first_name]', with: @alan.first_name
    page.fill_in 'author[last_name]', with: @alan.first_name
    page.fill_in 'author[homepage]', with: 'http://wikipedia.de/Edit'

    find('input[type="submit"]').click

    @alan.reload

    expect(@alan.homepage).to eq('http://wikipedia.de/Edit')
  end
end