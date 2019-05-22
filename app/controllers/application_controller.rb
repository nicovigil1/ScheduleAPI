class ApplicationController < ActionController::API

  def manager
    @manager ||= Manager.new
  end 
end
