require 'rails_helper'

class Api::V1::AppointmentsController < ApplicationController
  def create
    schedule = manager.find_schedule(params[:schedule_name])
    render json: schedule.add_appt(params[:start], params[:end])
  end

  def index
    render json: manager.all_appts
  end 

  def destroy
    schedule = manager.find_schedule(params[:schedule_name])
    schedule.del_appt(params[:start])
    render json: manager.all_appts
  end 
end