class ApplicationController < ActionController::Base
  protect_from_forgery

  Rails.application.eager_load!

end
