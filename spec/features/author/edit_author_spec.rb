require 'rails_helper'


describe "New author page", type: :feature do

  before(:each) do
    @alan = FactoryBot.create :author
  end

  HOMEPAGE = 'http://wikipedia.de/Edit'

  it "should render withour error" do
    visit edit_author_path(@alan)
  end

  it "should edit author" do
    visit edit_author_path(@alan)

    page.fill_in 'author[first_name]', with: @alan.first_name
    page.fill_in 'author[last_name]', with: @alan.first_name
    page.fill_in 'author[homepage]', with: HOMEPAGE

    find('input[type="submit"]').click

    @alan.reload

    expect(@alan.homepage).to eq(HOMEPAGE)
  end
end