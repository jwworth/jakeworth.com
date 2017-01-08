class Post < ApplicationRecord
  validates_presence_of :body
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_uniqueness_of :url_slug

  scope :ordered, -> { order('created_at desc') }

  before_create :generate_url_slug

  def to_param
    url_slug
  end

  def self.slugify(title)
    title.downcase.tr(' ', '-').gsub(/[^a-z0-9-]/, '')
  end

  def one_year_or_older?
    created_at < 1.year.ago
  end

  def display_date
    created_at.strftime('%b %-e, %Y')
  end

  def anniversary?
    Date.today.yday == created_at.yday && !created_at.today?
  end

  private

  def generate_url_slug
    self.url_slug = Post.slugify(title) if url_slug.nil? || url_slug.empty?
  end
end
