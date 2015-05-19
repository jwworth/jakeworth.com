class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :developer

  if ENV['http_auth']
    http_basic_authenticate_with name: ENV['http_name'], password: ENV['http_password']
  end

  private

  def require_developer
    redirect_to root_path unless developer_signed_in?
  end
end
