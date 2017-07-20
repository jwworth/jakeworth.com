# frozen_string_literal: true

class SpeakingEngagementDecorator < Draper::Decorator
  delegate_all

  def display_title
    if date > Date.today
      "#{title} (upcoming)"
    else
      title
    end
  end
end
