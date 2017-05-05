class SpeakingEngagement < ApplicationRecord
  validates_presence_of :title, :location, :date
  scope :by_date, -> { order('date desc') }

  def video_hyperlink=(video_hyperlink)
    self[:video_hyperlink] = video_hyperlink.presence
  end

  def slides_hyperlink=(slides_hyperlink)
    self[:slides_hyperlink] = slides_hyperlink.presence
  end
end
