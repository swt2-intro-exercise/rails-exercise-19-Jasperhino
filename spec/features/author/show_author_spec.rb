require 'rails_helper'

describe "Show author page", type: :feature do
    before(:each) do
        @alan = FactoryBot.create :author
    end

    it "should render without error" do
        visit author_path(@alan)
        expect(page).to have_text("Show Author")
    end

    it "should display name and website" do
        visit author_path(@alan)
        expect(page).to have_text(@alan.name)
        expect(page).to have_text(@alan.homepage)
    end
end