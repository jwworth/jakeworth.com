class Project < ApplicationRecord
  validates_presence_of :title, :description, :hyperlink
  scope :featured, -> { where('featured_order is not null') }
end
