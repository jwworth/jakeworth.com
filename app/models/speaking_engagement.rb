class SpeakingEngagement < ActiveRecord::Base
  scope :by_date, -> { order('date desc') }
end
