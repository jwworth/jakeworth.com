class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :developer
end
