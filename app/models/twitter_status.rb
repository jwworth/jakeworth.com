class TwitterStatus

  attr_reader :post

  def initialize(post)
    @post = post
  end

  def post_to_twitter
    TwitterClient.update(status) if ENV['twitter_consumer_key']
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

  def status
    "New blog post: '#{title}' #{url}"
  end
end
