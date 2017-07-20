# frozen_string_literal: true

class ProjectsController < ApplicationController
  helper_attr_accessor :project, :projects

  before_action :require_developer
  before_action :set_project, only: %i[edit update]

  def new
    self.project = Project.new
  end

  def update
    if project.update(project_params)
      redirect_to '/about', notice: 'Project updated'
    else
      flash.now[:notice] = project.errors.full_messages
      render :edit
    end
  end

  def create
    self.project = Project.new(project_params)
    if project.save
      redirect_to '/about', notice: 'Project created'
    else
      flash.now[:notice] = project.errors.full_messages
      render :new
    end
  end

  def index
    self.projects = Project.order(:featured_order)
  end

  private

  def set_project
    self.project = Project.find_by_id!(params[:id])
  end

  def project_params
    params.require(:project).permit :title, :body, :description, :featured_order, :hyperlink
  end
end
