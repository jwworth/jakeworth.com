class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :developer

  if creds = ENV['basic_auth']
    username, password = creds.split(':', 2)
    http_basic_authenticate_with name: username, password: password
  end

  def self.helper_attr_accessor *attr_names
    attr_names.each do |n|
      attr_accessor n
      helper_method n, :"#{n}="
      hide_action n
    end
  end

  private

  def require_developer
    redirect_to root_path unless developer_signed_in?
  end
end
