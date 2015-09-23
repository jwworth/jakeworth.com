class Project < ActiveRecord::Base
  validates_presence_of :title, :description, :hyperlink
  scope :featured, -> { where(featured: true) }
end
