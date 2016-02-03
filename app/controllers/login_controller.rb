class LoginController < ApplicationController

  before_action :set_auth

  def index
    if current_user then
      if current_user[:phone] then
        redirect_to feed_path
      else
        render 'info'
      end 
    else
      render 'index'
    end
  end

  def info
    if !current_user then 
      redirect_to login_path 
    else
      if current_user[:phone] then
        redirect_to feed_path
      else
        render 'info'
      end
    end
  end

  def update_info
    if !current_user then 
      redirect_to index_path 
    else
      params.require(:phone)
      params.require(:name)

      current_user.update_attributes(:phone => params[:phone], :name => params[:name])

      redirect_to feed_path
    end
  end

  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end
