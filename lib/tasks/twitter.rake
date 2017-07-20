# frozen_string_literal: true

namespace :twitter do
  desc 'Tweet old posts on the anniversary of their publication'
  task archive_status: :environment do
    if anniversary_post = Post.select(&:anniversary?).sample
      print "Tweeting post: #{anniversary_post.title}"
      TwitterStatus.new(anniversary_post).post_archive_status_to_twitter
      puts ' ...done.'
    else
      puts 'No anniversary posts today.'
    end
  end
end
