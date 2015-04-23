Given 'a developer exists' do
  @developer = FactoryGirl.create(:developer)
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

Then 'I am logged in' do
  expect(page).to have_link 'Create post'
end

When 'I click log out' do
  click_on 'Log out'
end

Then 'I am not logged in' do
  expect(page).to_not have_content 'Log out'
end

Given 'I am a visitor' do
  # noop
end

And 'I visit the homepage' do
  visit root_path
end

Then 'I see the homepage' do
  expect(current_path).to eq root_path
end

Then 'I see links' do
  within 'body ul' do
    expect(page).to have_link 'Github', href: 'http://github.com/jwworth'
    expect(page).to have_link 'Twitter', href: 'http://twitter.com/jwworth'
    expect(page).to have_link 'Email', href: 'mailto:jake@worth-chicago.co'
  end
end

Then 'I see the page for that post' do
  within 'h3' do
    expect(page).to have_content 'Newest post'
  end

  within 'body' do
    expect(page).to have_content 'Newest body'
    expect(page).to have_content @newest_post.created_at.strftime('%F')
  end
end

And 'I see copyright information' do
  within 'footer' do
    expect(page).to have_content "© #{Date.today.year} Jake Worth"
  end
end

Given(/^I am a signed in developer$/) do
  steps %Q{
    Given a developer exists
    When I go to the login link
    When I enter valid credentials into the form
  }
end

And 'a post exists' do
  @post = FactoryGirl.create(:post)
end

Given(/^I click create post$/) do
  click_on 'Create post'
end

Given(/^I click edit post$/) do
  click_on '[edit]'
end

Then 'I see the post edit page' do
  within 'h3' do
    expect(page).to have_content 'Edit post'
  end
end

Then 'I see my edited post' do
  expect(page).to have_content 'Awesome new title'
  expect(page).to have_content 'Awesome new body'
end

Then(/^I see the post create page$/) do
  within 'h3' do
    expect(page).to have_content 'Create post'
  end
end

When(/^I enter valid information into that form$/) do
  within 'form' do
    fill_in 'Title', with: 'Awesome title'
    fill_in 'Body', with: 'Awesome body'
    click_on 'Submit'
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
  within '.title' do
    expect(page).to have_content('Awesome title')
  end
end

Then(/^I see a message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

When 'I visit the new post path' do
  visit '/posts/new'
end

And 'posts exist' do
  2.times { FactoryGirl.create(:post) }
  @newest_post = FactoryGirl.create(:post, title: 'Newest post', body: 'Newest body')
end

When 'I click the newest post' do
  click_on 'Newest post'
end
