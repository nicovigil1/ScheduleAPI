class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :manager
  
  def manager 
    session[:manager] ||= Manager.new
  end 
end
