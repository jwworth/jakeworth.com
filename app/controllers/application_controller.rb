class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :developer

  if creds = ENV['basic_auth']
    username, password = creds.split(':', 2)
    http_basic_authenticate_with name: username, password: password
  end

  private

  def require_developer
    redirect_to root_path unless developer_signed_in?
  end
end
