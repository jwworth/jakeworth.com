class ProjectsController < ApplicationController
  helper_attr_accessor :projects

  def index
    self.projects = Project.featured.shuffle
  end
end
