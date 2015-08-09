Given(/^I have signed up on the platform as a donor$/) do
  visit new_user_registration_path

  fill_in('Email', :with => 'testuser@test.com')
  fill_in('Password', :with => 'password123')
  fill_in('Password confirmation', :with => 'password123')

  click_on('Sign up')
end

When(/^I go to the homepage$/) do
  visit root_path
end

When(/^I click on the new donation button$/) do
  click_on("Neue Spende")
end

Then(/^I should be on the new donation page$/) do
  uri = URI.parse(current_url)

  expect(uri.path).to eq(new_donation_path)
end

Given(/^I'm on the new donation page$/) do
  visit new_donation_path
end

Given(/^I fill in the donation data and click on the create button$/) do
  fill_in('Title', :with => 'Test Donation')
  fill_in('Amount', :with => 20)

  click_on('Create Donation')
end

Then(/^I should see my new donation$/) do
  uri = URI.parse(current_url)

  expect(uri.path).to eq(donation_path(Donation.last))
end

Then(/^I should see a confirmation message$/) do
  expect(page).to have_css(".alert-box span", :text => "Spende wurde erstellt")
end
