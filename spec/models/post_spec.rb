require 'rails_helper'

describe Post do
  it 'should have a valid factory' do
    post = FactoryGirl.create(:post)

    expect(post).to be_valid
  end
end
