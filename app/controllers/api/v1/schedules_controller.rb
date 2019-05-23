class Api::V1::SchedulesController < ApplicationController
  def index 
    render json: manager.schedules
  end 

  def create
    manager.add_schedule(params[:name])
    render json: manager.schedules
  end

  def destroy
    render json: manager.delete_schedule(params[:name])
  end 
  
end 