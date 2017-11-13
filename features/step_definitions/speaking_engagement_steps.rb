# frozen_string_literal: true

When(/^I click edit speaking engagement$/) do
  click_on '[edit]'
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
  expect(page).to have_content 'New Title'
end

When(/^I try to visit the edit speaking engagement path$/) do
  visit edit_speaking_engagement_path @speaking_engagement
end

Given(/^I click create speaking engagement$/) do
  click_on 'New Speaking Engagement'
end

Then(/^I see the speaking engagement create page$/) do
  expect(page).to have_selector('h3', text: 'Create Speaking Engagement')
end

Given(/^I try to visit the new speaking engagement path$/) do
  visit new_speaking_engagement_path
end

Given(/^(\d+) speaking engagements$/) do |num|
  FactoryGirl.create_list(:speaking_engagement, num.to_i)
end

Then(/^I see (\d+) speaking engagements$/) do |num|
  within 'ul.talks' do
    expect(page).to have_selector('li', count: num.to_i)
  end
end
