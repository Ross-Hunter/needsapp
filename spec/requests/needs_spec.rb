require 'spec_helper'

describe "Needs" do
  describe "POST /needs" do
    fixtures :users

    it "create need", :js => true do
      visit root_path
      fill_in "password", :with => 'admin'
      click_button "Log in"
      visit needs_path
      click_link "Post a Need"
      fill_in "Title (Required)", :with => 'Test Need'
      fill_in "Date (Required)", :with => '2012-06-29'
      click_button "Add Slot"
      fill_in "need_slots_attributes_0_note", :with => 'Test Note'
      click_button "Post Need"
      page.should have_content("Test Need")
      page.should have_content("Test Note")
    end
  end
end
