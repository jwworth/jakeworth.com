# frozen_string_literal: true

class AboutController < ApplicationController
  helper_attr_accessor :links, :projects, :speaking_engagements

  def show
    self.links = JSON.parse(File.read(Rails.root.join('app', 'assets', 'links.json')))
    self.projects = Project.featured.order(:featured_order)
    self.speaking_engagements = SpeakingEngagementDecorator.decorate_collection(SpeakingEngagement.by_date)
  end
end
