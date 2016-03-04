class AboutController < ApplicationController
  helper_attr_accessor :projects

  def show
    self.projects = Project.featured.order(:featured_order)
  end
end
