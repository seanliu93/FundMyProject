class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @ending_projects = Project.ending_projects
  end

  def show
    if user_signed_in?
      @fund = Fund.new(backer_id: current_user.id, project_id: @project.id)
    else

    end
  end

  def new
    if user_signed_in?
      @project = Project.new(user_id: current_user.id)
    else
      redirect_to home_path, alert: "You must be signed in to do that"
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project), notice: "Project successfully created!"
    else
      render :new
    end
  end
 
  def edit
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project successfully destroyed"
  end


  private
  def set_project
    @project = Project.find(params[:id])
    redirect_to projects_path, alert: "Project with that id not found" if @project.nil?
  end

  def project_params
    params.require(:project).permit(:user_id, :title, :description, :fund_goal, :end_date, :new_category, category_ids:[])
  end
end
