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

  it 'should build a url slug' do
    post = FactoryGirl.create(:post, title: 'A post about rails')

    expect(post.url_slug).to eq 'a-post-about-rails'
  end

  it 'should build a url slug with no excalmations' do
    post = FactoryGirl.create(:post, title: 'A post about rails!')

    expect(post.url_slug).to eq 'a-post-about-rails'
  end

  it 'should build a url slug with no question marks' do
    post = FactoryGirl.create(:post, title: 'A post about rails?')

    expect(post.url_slug).to eq 'a-post-about-rails'
  end

  it 'should build a url slug with no colons' do
    post = FactoryGirl.create(:post, title: 'A post about: rails')

    expect(post.url_slug).to eq 'a-post-about-rails'
  end

  it 'should build a url slug with no octothorpes' do
    post = FactoryGirl.create(:post, title: 'A post about #rails')

    expect(post.url_slug).to eq 'a-post-about-rails'
  end

  it 'should build a url slug with no dots' do
    post = FactoryGirl.create(:post, title: 'A post about .rails')

    expect(post.url_slug).to eq 'a-post-about-rails'
  end

  it 'should validate title uniqueness' do
    post = FactoryGirl.create(:post, title: 'Title')
    dup_post = FactoryGirl.build(:post, title: 'Title')

    expect(dup_post).to_not be_valid
    expect(dup_post.errors[:title]).to eq ['has already been taken']
  end

  it 'it should be able to slugify any title' do
    title = 'foo bar baz'
    expect(Post.slugify(title)).to eq 'foo-bar-baz'
  end
end
