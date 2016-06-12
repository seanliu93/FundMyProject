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
      if @fund.submit
        render json: @fund, status: 201
      else
        render plain: "You don't have enough in your balance to fund that much!", status: 403
      end
    else
      render plain: "Invalid fund amount entered!", status: 403
    end
  end

  private
  def fund_params
   params.require(:fund).permit(:backer_id, :project_id, :amount)
  end
end
