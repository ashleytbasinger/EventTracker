require 'spec_helper'

feature "User submits a contact inquiry" do
  # As a User
  # I want to submit a new contact inquiry
  # So that I can get what I want
  #
  # Acceptance Criteria:
  #
  # * I must provide a first name, last name, email, subject, and description.

  scenario "creates a contact inquiry" do
    # Visit the page containing the new contact form
    visit '/contacts'
    # save_and_open_page
    click_link "New Contact"
    fill_in 'First name', with: 'Rumplestiltskin'
    fill_in 'Last name', with: 'Grimm'
    fill_in 'Email', with: 'gold_spinner@tomfoolery.com'
    fill_in 'Subject', with: 'Thread Shortage'
    fill_in 'Description', with: 'Need more thread, send me more or I will be angry.'
    click_button 'Create Contact'
    expect(page).to have_content('Inquiry was successfully submitted')
  end

  it 'does not record my inquiry and gives me an error if invalid' do
    prev_count = Contact.count
    visit '/contacts'
    click_link "New Contact"
    click_button "Create Contact"
    expect(page).to have_content("can't be blank")
    expect(Contact.count).to eql(prev_count)
  end
end