class SessionsController < ApplicationController
  def create
    developer = Developer.find_by(email: params[:session][:email].downcase)
    if developer && developer.authenticate(params[:session][:password])
      sign_in developer
      redirect_back_or_to root_path
    else
      render :new
    end
  end
end
