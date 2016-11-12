When(/^I click edit speaking engagement$/) do
  within '#speaking-engagements' do
    click_on '[edit]'
  end
end

Given(/^a speaking engagement exists with title "([^"]*)"$/) do |title|
  FactoryGirl.create :speaking_engagement, title: title
end

Then(/^I see the edit speaking enagement page$/) do
  expect(page).to have_selector('h3', text: 'Edit Speaking Engagement')
end

When(/^I edit the speaking engagement$/) do
  fill_in 'Title', with: 'New Title'
  click_on 'Submit'
end

Then(/^I see my updated speaking engagement$/) do
  within '#speaking-engagements' do
    expect(page).to have_content 'New Title'
  end
end

When(/^I try to visit the edit speaking engagement path$/) do
  visit edit_speaking_engagement_path @speaking_engagement
end

Given(/^I click create speaking_engagement$/) do
  click_on '+ Speaking Engagement'
end

Then(/^I see the speaking_engagement create page$/) do
  expect(page).to have_selector('h3', text: 'Create Speaking Engagement')
end

Given(/^I try to visit the new speaking_engagement path$/) do
  visit new_speaking_engagement_path
end