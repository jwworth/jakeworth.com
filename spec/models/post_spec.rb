# frozen_string_literal: true

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

  context 'it should build a URL slug' do
    specify 'with dashes' do
      post = FactoryGirl.create(:post, title: 'A post about rails')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no excalmations' do
      post = FactoryGirl.create(:post, title: 'A post about rails!')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no question marks' do
      post = FactoryGirl.create(:post, title: 'A post about rails?')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no colons' do
      post = FactoryGirl.create(:post, title: 'A post about: rails')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no octothorpes' do
      post = FactoryGirl.create(:post, title: 'A post about #rails')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no dots' do
      post = FactoryGirl.create(:post, title: 'A post about .rails')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no commas' do
      post = FactoryGirl.create(:post, title: 'A post about, rails')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'with no parens' do
      post = FactoryGirl.create(:post, title: 'A post about (rails)')
      expect(post.url_slug).to eq 'a-post-about-rails'
    end

    specify 'that is unique' do
      FactoryGirl.create(:post, url_slug: 'a-post-about-rails')

      expect do
        FactoryGirl.create(:post, url_slug: 'a-post-about-rails')
      end.to raise_error ActiveRecord::RecordInvalid
    end
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

  it 'should know if it is an anniversary post' do
    today_post        = FactoryGirl.create(:post)
    year_old_post     = FactoryGirl.create(:post, created_at: 1.year.ago)
    two_year_old_post = FactoryGirl.create(:post, created_at: 2.years.ago)
    random_post       = FactoryGirl.create(:post, created_at: 1.week.ago)

    expect(today_post.anniversary?).to eq false
    expect(year_old_post.anniversary?).to eq true
    expect(two_year_old_post.anniversary?).to eq true
    expect(random_post.anniversary?).to eq false
  end
end
