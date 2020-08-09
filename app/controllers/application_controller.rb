class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session #disable CSRF protection, when API request doesn't have HTML form
  
end
