require 'rails_helper'

describe TwitterStatus do

  let(:post) { FactoryGirl.build(:post, title: 'Hacking on Elixir', url_slug: 'hacking-on-elixir') }

  let(:twitter_status) { described_class.new(post) }

  describe '#status' do
    it 'returns a Twitter status' do
      expected = "New blog post: 'Hacking on Elixir' http://www.jakeworth.com/hacking-on-elixir"
      actual = twitter_status.send(:status)

      expect(actual).to eq expected
    end
  end
end
