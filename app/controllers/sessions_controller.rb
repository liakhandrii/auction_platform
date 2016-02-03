class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_path, notice: "SIGNED OUT"
  end

  def create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to info_path, notice: ""
  end

end
