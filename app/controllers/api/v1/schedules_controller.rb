class Api::V1::SchedulesController < ApplicationController
  
  def create
    manager.add_schedule(params[:name])
    render json: manager.schedules
  end
end 