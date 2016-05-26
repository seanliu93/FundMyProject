class Users::ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def show
    if @user.id == current_user.id
      render :show_self
    end
  end

  private
  def set_user
    if user_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end
end
