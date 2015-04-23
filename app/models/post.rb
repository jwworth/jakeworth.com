class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body
  validates_uniqueness_of :title

  before_create :generate_url_slug

  def to_param
    url_slug
  end

  private

  def generate_url_slug
    self.url_slug = title.downcase.gsub(' ', '-')
  end
end

