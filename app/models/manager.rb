class Manager
  attr_reader :schedules

  def initialize
    @schedules = []
  end
  
  def add_schedule(name)
    new_schedule = Schedule.new(name)
    @schedules << new_schedule
  end 

  def delete_schedule(name)
    new_schedules = @schedules.reject! {|schedule| schedule.name == name}
    "schedule not found" if new_schedules == nil
  end 
end 