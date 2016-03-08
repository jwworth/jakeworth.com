class AboutController < ApplicationController
  helper_attr_accessor :projects, :speaking_engagements

  def show
    self.projects = Project.featured.order(:featured_order)
    self.speaking_engagements = SpeakingEngagement.by_date
  end
end
