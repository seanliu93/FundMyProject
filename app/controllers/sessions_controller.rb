class SessionsController < ApplicationController
 
  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.email = auth['info']['email']
    end
    sign_in(:user, user)
    session[:user_id] = user.id
    redirect_to root_path
  end
 
  def auth
    request.env['omniauth.auth']
  end
 
end