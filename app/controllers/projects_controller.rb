class ProjectsController < ApplicationController
  helper_attr_accessor :projects, :project

  before_action :require_developer, except: :index
  before_action :set_project, only: [:edit, :update]

  def index
    self.projects = Project.featured.order(:featured_order)
  end

  def new
    self.project = Project.new
  end

  def update
    if project.update(project_params)
      redirect_to projects_path, notice: 'Project updated'
    else
      flash.now[:notice] = project.errors.full_messages
      render :edit
    end
  end

  def create
    self.project = Project.new(project_params)
    if project.save
      redirect_to projects_path, notice: 'Project created'
    else
      flash.now[:notice] = project.errors.full_messages
      render :new
    end
  end

  private

  def set_project
    self.project = Project.find_by_id!(params[:id])
  end

  def project_params
    params.require(:project).permit :title, :body, :description, :featured_order, :hyperlink
  end
end
