class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end


  private
  def fund_params
   params.require(:fund).permit(:backer_id, :project_id, :amount)
  end
end
