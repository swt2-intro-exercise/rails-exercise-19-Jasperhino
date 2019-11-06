require 'rails_helper'

describe "New author page", type: :feature do
  it "should render withour error" do
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    
    # these are the standard names given to inputs by the form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should have new author in db after submit" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Edsger'
    page.fill_in 'author[last_name]', with: 'Dijkstra'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Edsger_W._Dijkstra'
    find('input[type="submit"]').click
  end

  it "should not validate without lastname" do
    author = Author.new( :first_name => 'Alan', :homepage => 'http://wikipedia.org/Alan_Turing')
    expect(author).to_not be_valid
  end

  it "should have error with non validated input" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Edsger'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Edsger_W._Dijkstra'
    find('input[type="submit"]').click
    expect(page).to have_text('prohibited this author from being saved')
  end
end