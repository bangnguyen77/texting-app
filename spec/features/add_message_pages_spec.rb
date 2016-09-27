require 'rails_helper'

describe 'the add a message process', :vcr => true do
  it "adds a message" do
    contact = FactoryGirl.create(:contact)
    visit root_path
    click_link "See all messages"
    click_link "New message"
    check("Test Name")
    fill_in "From", :with => "503222"
    fill_in "Body", :with => "Something"
    click_on "Create"
    expect(page).to have_content("Something")
  end
end
