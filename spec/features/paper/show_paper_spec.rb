require 'rails_helper'

describe "Show paper page", type: :feature do
    before(:each) do
        @alan = FactoryBot.create :author
        @computing = FactoryBot.create :paper
    end

  it "should render withour error" do
    visit paper_path(@computing)
  end

  it "should display authors name" do
    visit paper_path(@computing)

    expect(page).to have_text(@alan.name)
  end

end