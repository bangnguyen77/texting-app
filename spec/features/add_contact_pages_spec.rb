require "rails_helper"

describe "the add a contact process" do
  it "adds a contact" do
    visit root_path
    click_link "Add a contact"
    fill_in "Name", :with => "Test Name"
    fill_in "Phone", :with => "4843782551"
    click_on "Create Contact"
    expect(page).to have_content("Test Name")
  end


end
