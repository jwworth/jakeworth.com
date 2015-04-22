require 'rails_helper'

describe Post do
  it 'should have a valid factory' do
    post = FactoryGirl.create(:post)

    expect(post).to be_valid
  end

  it 'should require a title' do
    post = FactoryGirl.build(:post, title: nil)

    expect(post).to_not be_valid
  end

  it 'should require a body' do
    post = FactoryGirl.build(:post, body: nil)

    expect(post).to_not be_valid
  end
end
