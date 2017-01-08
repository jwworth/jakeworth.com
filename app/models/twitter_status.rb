class TwitterStatus

  include ActionView::Helpers

  attr_reader :post

  def initialize(post)
    @post = post
  end

  def post_status_to_twitter
    TwitterClient.update(status) if ENV['twitter_consumer_key']
  end

  def post_archive_status_to_twitter
    TwitterClient.update(archive_status) if ENV['twitter_consumer_key']
  end


  private

  def title
    post.title
  end

  def url_slug
    post.url_slug
  end

  def host
    ENV.fetch('host')
  end

  def url
    Rails.application.routes.url_helpers.post_url(url_slug, host: host)
  end

  def archive_hashtag
    "#{pluralize(Date.today.year - post.created_at.year, 'yr').delete(' ')}ago"
  end

  def status
    "New blog post: '#{title}' #{url}"
  end

  def achive_status
    "'#{title}' #{url} ##{archive_hashtag}"
  end
end
