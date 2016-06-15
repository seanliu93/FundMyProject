class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @categories}
    end
  end

  def show
    @category = Category.find(params[:id])
  end


  private
  def fund_params
   params.require(:fund).permit(:backer_id, :project_id, :amount)
  end
end
