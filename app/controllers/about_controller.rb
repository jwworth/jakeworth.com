# frozen_string_literal: true

class AboutController < ApplicationController
  helper_attr_accessor :projects, :speaking_engagements

  def show
    self.projects = Project.featured.order(:featured_order)
    self.speaking_engagements = SpeakingEngagementDecorator.decorate_collection(SpeakingEngagement.by_date)
  end
end
