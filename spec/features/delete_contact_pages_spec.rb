require 'rails_helper'

describe "the delete a contact process" do
  it 'deletes a contact' do
    visit root_path
    click_link "Add a contact"
    fill_in "Name", :with => "Test Name"
    fill_in "Phone", :with => "5030000000"
    click_on "Create Contact"
    click_link "Delete"
    expect(page).to have_content("All Contacts")
  end
end
