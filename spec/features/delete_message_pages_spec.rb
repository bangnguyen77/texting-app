require "rails_helper"

describe "the delete a message process", :vcr => true do
  it "will delete a message" do
    contact = FactoryGirl.create(:contact)
    visit messages_path
    click_link "New message"
    check("Test Name")
    fill_in "From", :with => "8562830298"
    fill_in "Body", :with => "Test message"
    click_on "create"
    save_and_open_page
    click_on "delete"
    expect(page).to have_content "Messages"

  end
end
