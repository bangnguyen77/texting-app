require 'rails_helper'

describe 'the add a message process', :vcr => true do
  it "adds a message" do
    contact = FactoryGirl.create(:contact)
    message = FactoryGirl.create(:message)
    visit new_message_path
    check(contact.name)
    fill_in "From", :with => message.from
    fill_in "Body", :with => message.body
    click_on "Create"
    save_and_open_page
    expect(page).to have_content(message.body)
  end
end
