class FundsController < ApplicationController
  def index
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @funds = @project.funds
    else
      @funds = Fund.all
    end
  end

  def create
    @fund = Fund.new(fund_params)
    if @fund.save
      @fund.submit
      redirect_to project_path(@fund.project_id), notice: "Successfully funded to this project!"
    else
      @project = Project.find(@fund.project_id)
      render "/projects/show"
    end
  end

  private
  def fund_params
   params.require(:fund).permit(:backer_id, :project_id, :amount)
  end
end
