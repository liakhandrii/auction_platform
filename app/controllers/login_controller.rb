class LoginController < ApplicationController

  before_action :set_auth

  def index
    render 'index'
  end

  def info
    render 'info'
  end

  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end
