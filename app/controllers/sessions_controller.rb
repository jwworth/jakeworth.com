class SessionsController < ApplicationController
  before_action :redirect_home, only: [:new]

  def create
    developer = Developer.find_by(email: params[:session][:email].downcase)
    if developer && developer.authenticate(params[:session][:password])
      sign_in developer
      redirect_back_or_to root_path, notice: 'Logged in'
    else
      flash.now[:alert] = 'Access denied'
      render :new
    end
  end

  def destroy
    sign_out_developer
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def redirect_home
    redirect_to root_path if developer_signed_in?
  end
end
