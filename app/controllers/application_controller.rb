class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :developer

  if ENV['http_auth']
    http_basic_authenticate_with name: ENV['http_name'], password: ENV['http_password']
  end

  private

  def require_developer
    unless developer_signed_in?
      redirect_to root_path, alert: 'Access denied'
    end
  end
end
