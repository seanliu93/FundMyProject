class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    Project.update
    @projects = Project.order("end_date asc")
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
    if Project.find_by(title: params[:project][:title]).nil?
      @project = Project.new(project_params)
      if @project.save
        redirect_to project_path(@project), notice: "Project successfully created!"
      else
        redirect_to new_project_path(@project), alert: "Invalid input"
      end
    else
      redirect_to new_project_path(@project), alert: "Project title already taken"
    end
  end
 
  def edit
  end

  def update
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.fund_goal = params[:project][:fund_goal]
    @project.end_date = params[:project][:end_date]
    if @project.save
      redirect_to project_path(@project)
    else
      redirect_to new_project_path(@project), alert: "Invalid input"
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
    params.require(:project).permit(:user_id, :title, :description, :fund_goal, :end_date)
  end
end
