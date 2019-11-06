require 'rails_helper'

describe "New author page", type: :feature do
    it "should render without error" do
        visit author_path(@alan)
        expect(page).to have_text("Show Author")
        expect(page).to have_text("Alan")
        expect(page).to have_text("Turing")
    end
end