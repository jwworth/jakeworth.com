class ProjectsController < ApplicationController
  helper_attr_accessor :projects, :project
  before_action :require_developer, except: :index

  def index
    self.projects = Project.featured.shuffle
  end

  def new
    self.project = Project.new
  end

  def create
    self.project = Project.new(project_params)
    if project.save
      redirect_to projects_path, notice: 'Project created'
    else
      flash.now[:alert] = project.errors.full_messages
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit :title, :body, :description, :featured, :hyperlink
  end
end
