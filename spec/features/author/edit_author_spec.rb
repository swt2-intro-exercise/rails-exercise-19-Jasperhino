require 'rails_helper'

describe "New author page", type: :feature do
  it "should render withour error" do
    visit edit_author_path
  end
end