# frozen_string_literal: true

include PostHelper
include ActionView::Helpers::TagHelper

Given 'a developer exists' do
  @developer = FactoryBot.create(:developer)
end

When 'I go to the login link' do
  visit new_session_path
end

When 'I enter valid credentials into the form' do
  within 'form' do
    fill_in 'Email', with: @developer.email
    fill_in 'Password', with: @developer.password
  end
  click_on 'Submit'
end

When 'I enter invalid credentials into the form' do
  within 'form' do
    fill_in 'Email', with: 'foo'
    fill_in 'Password', with: 'bar'
  end
  click_on 'Submit'
end

When 'I enter invalid information into the project form' do
  click_on 'Submit'
end

Then 'I am logged in' do
  expect(page).to have_link 'New Project'
end

When 'I click log out' do
  click_on 'Logout'
end

Then 'I am not logged in' do
  expect(page).to_not have_content 'Log out'
end

Given 'I am a visitor' do
  # noop
end

And 'I visit the homepage' do
  visit root_path
  expect(page.title).to eq 'Jake Worth'
end

And 'a project exists' do
  @project = FactoryBot.create :project
end

And 'a speaking engagement exists' do
  @speaking_engagement = FactoryBot.create(:speaking_engagement,
                                            title: 'Haxoring everything!',
                                            location: 'ChicagoRuby Meetup',
                                            date: '2016-03-07 21:10:26 -0600')
end

And 'a future speaking engagement exists' do
  FactoryBot.create(:speaking_engagement,
                     title: 'Haxoring everything!',
                     location: 'ChicagoRuby Meetup',
                     date: Time.now + 1.month)
end

And 'a non-featured project exists' do
  FactoryBot.create :project, featured_order: nil, title: 'Not special'
end

Then(/^I see the project$/) do
  expect(page).to have_link('A cool project', href: 'http://www.google.com')
  expect(page).to have_content 'With cool features'
end

Then(/^I see the speaking engagement$/) do
  within 'main' do
    title = 'Haxoring everything!'
    expect(page).to have_selector('em', text: title)
    expect(page).to have_content(title + ', ChicagoRuby Meetup, March 2016')
  end
end

Then(/^I see the future speaking engagement$/) do
  within 'main' do
    title = 'Haxoring everything! (upcoming)'
    expect(page).to have_content(title)
  end
end

Then(/^I do not see the non-featured project$/) do
  expect(page).to_not have_content 'Not special'
end

Then 'I see the homepage' do
  expect(current_path).to eq root_path
end

Then 'I see links' do
  expect(page).to have_link 'Github', href: 'https://github.com/jwworth'
  expect(page).to have_link 'Twitter', href: 'https://twitter.com/jwworth'
  expect(page).to have_link 'get in touch', href: 'mailto:jake+blog@jakeworth.com'
end

Then 'I see an edit button' do
  expect(page).to have_link '[edit]'
end

Then 'I see the page for that post' do
  expect(page).to have_content 'Newest post'

  expect(page.title).to include 'Newest post - Jake Worth'

  expect(page).to have_content 'Newest body'
  expect(page).to have_content @newest_post.created_at.strftime('%b %-e, %Y')
end

And 'I see project information' do
  within 'footer' do
    expect(page).to have_link 'open source', href: 'http://github.com/jwworth/jakeworth.com'
  end
end

Given(/^I am a signed in developer$/) do
  steps %(
    Given a developer exists
    When I go to the login link
    When I enter valid credentials into the form
    )
end

And 'a post exists' do
  @post = FactoryBot.create(:post)
end

Given(/^I click create post$/) do
  click_on 'New Post'
end

Given(/^I click create project$/) do
  click_on 'New Project'
end

And 'I try to visit the new project path' do
  visit new_project_path
end

Given(/^I click edit post$/) do
  click_on '[edit]'
end

Then 'I see the post edit page' do
  within first('h3') do
    expect(page).to have_content 'Edit Post'
  end
end

Then 'I see my edited post' do
  expect(page).to have_content 'Awesome new title'
  expect(page).to have_content 'Awesome new body'
end

Then(/^I see the post create page$/) do
  within first('h3') do
    expect(page).to have_content 'Create Post'
  end
end

Then(/^I see the project create page$/) do
  within 'h3' do
    expect(page).to have_content 'Create Project'
  end
end

When(/^I enter valid information into that form$/) do
  within 'form' do
    fill_in 'Title', with: 'Awesome title'
    fill_in 'Body', with: 'Awesome body'
  end
end

When(/^I enter valid information into the project form$/) do
  within 'form' do
    fill_in 'Title', with: 'Google'
    fill_in 'Hyperlink', with: 'http://google.com'
    fill_in 'Description', with: 'A search engine.'
    fill_in 'Featured order', with: 1
    click_on 'Submit'
  end
end

When(/^I enter valid information into the project form but don't feature it$/) do
  within 'form' do
    fill_in 'Title', with: 'Google'
    fill_in 'Hyperlink', with: 'http://google.com'
    fill_in 'Description', with: 'A search engine.'
    click_on 'Submit'
  end
end

When 'I enter markdown into that form' do
  within 'form' do
    fill_in 'Title', with: 'Awesome title'
    fill_in 'Body', with: 'Awesome *emphasis* and `code`'
    click_on 'Submit'
  end
end

When 'I enter content into that form' do
  within 'form' do
    fill_in 'Title', with: 'Awesome title'
    fill_in 'Body', with: 'Awesome *emphasis* and `code`'
  end
end

Then 'I see a live preview' do
  within('.title_preview') do
    expect(page).to have_content('Awesome title')
  end

  within('.slug_preview') do
    expect(page).to have_content('awesome-title')
  end

  within '.content em' do
    expect(page).to have_content 'emphasis'
  end
end

Then 'I see my markdown post' do
  within('main') do
    expect(page).to have_selector('em', text: 'emphasis')
    expect(page).to have_selector('code', text: 'code')
  end
end

When(/^I enter new valid information into that form$/) do
  within 'form' do
    fill_in 'Title', with: 'Awesome new title'
    fill_in 'Body', with: 'Awesome new body'
    click_on 'Submit'
  end
end

When(/^I enter invalid information into that form$/) do
  within 'form' do
    fill_in 'Title', with: 'Awesome title'
    fill_in 'Body', with: ''
    click_on 'Submit'
  end
end

Then(/^I see my post$/) do
  within 'h3' do
    expect(page).to have_content('Awesome title')
  end
end

Then(/^I see my project$/) do
  expect(page).to have_content('Google')
end

Then(/^I do not see my project$/) do
  expect(page).to_not have_selector '.project'
end

Then(/^I see a message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

When 'I visit the new post path' do
  visit new_post_path
end

When 'I visit the edit post path' do
  visit edit_post_path @post
end

And 'posts exist' do
  2.times { FactoryBot.create(:post) }
  @newest_post = FactoryBot.create(:post, title: 'Newest post', body: 'Newest body')
end

When 'I click the newest post' do
  click_on 'Newest post'
end

Given(/^(\d+) posts exist$/) do |num|
  FactoryBot.create_list(:post, num.to_i)
end

Then(/^I see (\d+) post titles$/) do |num|
  expect(page).to have_selector '#posts-index li', count: num.to_i
end

When(/^I click "(.*?)"$/) do |arg|
  click_on arg
end

When 'I visit the Atom feed page' do
  visit root_path(format: 'atom')
end

Then 'I see an Atom feed' do
  expect(page).to have_content '?format=atom'
  expect(page).to have_content @post.title
end

When(/^I click edit project$/) do
  click_on '[edit]'
end

Then(/^I see the edit project page$/) do
  within 'h3' do
    expect(page).to have_content 'Edit Project'
  end
end

When(/^I edit the project$/) do
  within 'form' do
    fill_in 'Title', with: 'Yahoo'
    fill_in 'Hyperlink', with: 'http://yahoo.com'
    fill_in 'Description', with: 'Another search engine.'
    click_on 'Submit'
  end
end

Then(/^I see my updated project$/) do
  expect(page).to have_content('Yahoo')
end

When(/^I try to visit the edit project path$/) do
  visit edit_project_path @project
end

When(/^I edit the project with no title$/) do
  within 'form' do
    fill_in 'Title', with: ''
    click_on 'Submit'
  end
end

Then(/^I see a live preview with "(.*?)" as the slug$/) do |slug|
  within('.slug_preview') do
    expect(page).to have_content(slug)
  end
end

Then(/^I enter a slug "(.*?)"$/) do |slug|
  page.execute_script %{$("#post_url_slug").val('#{slug}').keyup()}
end

Then 'I see the header as a link' do
  within '.jumbotron' do
    expect(page).to have_link('Jake Worth', href: root_path)
  end
end

And 'a project exists with markdown' do
  FactoryBot.create(:project, description: '[cool link](http://google.com)')
end

When 'I visit the about page' do
  visit '/about'
end

Then 'I see my markdown project' do
  expect(page).to have_link('cool link', href: 'http://google.com')
end

And 'a favorite post exists' do
  @fav_post = FactoryBot.create(:post, title: 'This post rocks', favorite: true)
end

Then 'I see the favorited post' do
  within '#posts-index li' do
    expect(page).to have_content(CGI.unescapeHTML(EMOJIS.values[Date.today.wday]))
    expect(page).to have_link 'This post rocks', href: post_path(@fav_post)
  end
end

When(/^I check "([^"]*)"$/) do |name|
  check name
end

Then(/^I see (\d+) posts$/) do |num|
  expect(page).to have_selector '#posts-index li', count: num
end

Given(/^posts exist from (\d+) years? ago$/) do |year|
  @newest_post = FactoryBot.create(:post,
                                    created_at: year.to_i.years.ago,
                                    title: 'Newest post',
                                    body: 'Newest body')
end

Then(/^I see a deprecation warning$/) do
  within '.content' do
    disclaimer = 'Note: any code contained in this post is more than a year old. Please use at your own risk.'
    expect(page).to have_selector('em', text: disclaimer)
  end
end

Given(/^(\d+) projects+ exists$/) do |num|
  FactoryBot.create_list(:project, num.to_i)
end

When 'I visit the projects page' do
  visit projects_path
end

Then(/^I see (\d+) projects+$/) do |num|
  expect(page).to have_selector('.project', count: num.to_i)
end

Given(/^(\d+) favorited posts exist$/) do |count|
  FactoryBot.create_list(:post, count.to_i, favorite: true)
end

Then(/^I see the (\d+) favorited posts$/) do |count|
  expect(page).to have_selector('.favorite', count: count.to_i)
end

When(/^I click edit speaking engagement$/) do
  click_on '[edit]'
end

Given(/^a speaking engagement exists with title "([^"]*)"$/) do |title|
  FactoryBot.create :speaking_engagement, title: title
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
  FactoryBot.create_list(:speaking_engagement, num.to_i)
end

Then(/^I see (\d+) speaking engagements$/) do |num|
  expect(page).to have_selector('#talks li', count: num.to_i)
end

Given(/^I visit "([^"]*)"$/) do |path|
  visit path
end
