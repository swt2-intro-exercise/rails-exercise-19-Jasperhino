require 'rails_helper'

describe "Paper index page", type: :feature do

  before(:each) do
    @test50 = Paper.create(:title => "COMPUTING MACHINERY AND INTELLIGENCE",
        :venue => "test",
        :year => 1950,
        :authors => [])

    @test68 = Paper.create(:title => "COMPUTING INTELLIGENCE AND MACHINERY",
        :venue => "test",
        :year => 1968,
        :authors => [])
  end

  it "should render withour error" do
    visit papers_path
  end

  it "should allow filter by year" do
    visit papers_path
    expect(page).to have_text(@test50.title)
    expect(page).to have_text(@test68.title)

    visit papers_path(:year => 1950)
    expect(page).to have_text(@test50.title)
    expect(page).to_not have_text(@test68.title)

    visit papers_path(:year => 1968)
    expect(page).to_not have_text(@test50.title)
    expect(page).to have_text(@test68.title)

    visit papers_path(:year => 2000)
    expect(page).to_not have_text(@test50.title)
    expect(page).to_not have_text(@test68.title)
  end

end 