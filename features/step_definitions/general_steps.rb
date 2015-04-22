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
  expect(page).to have_content 'Signed In.'
end

Then 'I am not logged in' do
  expect(current_path).to eq new_session_path
  expect(page).to_not have_content 'Signed In.'
end
