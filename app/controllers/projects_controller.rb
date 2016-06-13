class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @ending_projects = Project.ending_projects
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @ending_projects}
    end
  end

  def show
    if user_signed_in?
      @fund = Fund.new(backer_id: current_user.id, project_id: @project.id)
    else
    end
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @project}
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
    @project.update(project_params)
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
    params.require(:project).permit(:user_id, :title, :description, :fund_goal, :end_date, :new_category, category_ids:[])
  end
end
