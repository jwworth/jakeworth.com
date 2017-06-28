# frozen_string_literal: true

require 'rails_helper'

describe TwitterStatus do
  let(:post) do
    FactoryGirl.build(:post,
                      title: 'Hacking on Elixir',
                      url_slug: 'hacking-on-elixir')
  end

  let(:old_post) do
    FactoryGirl.build(:post,
                      title: 'My First Ruby Post',
                      url_slug: 'my-first-ruby-post',
                      created_at: 5.years.ago)
  end

  describe '#status' do
    it 'returns a Twitter status' do
      twitter_status = described_class.new(post)

      expected = "New blog post: 'Hacking on Elixir' http://www.jakeworth.com/hacking-on-elixir"
      actual = twitter_status.send(:status)

      expect(actual).to eq expected
    end
  end

  describe '#archive_status' do
    it 'returns a Twitter status with appropriate hashtag' do
      twitter_status = described_class.new(old_post)

      expected = "'My First Ruby Post' http://www.jakeworth.com/my-first-ruby-post #5yrsago"
      actual = twitter_status.send(:archive_status)

      expect(actual).to eq expected
    end
  end
end
