class SpeakingEngagement < ActiveRecord::Base
  validates_presence_of :title, :location, :date
  scope :by_date, -> { order('date desc') }
end
