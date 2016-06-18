class Post < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_uniqueness_of :url_slug

  scope :ordered, -> { order('created_at desc').to_a }

  before_create :generate_url_slug

  def to_param
    url_slug
  end

  def self.slugify(title)
    title.downcase.tr(' ', '-').gsub(/[^a-z0-9-]/, '')
  end

  private

  def generate_url_slug
    self.url_slug = Post.slugify(title) if url_slug.nil? || url_slug.empty?
  end
end
