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
    new_schedules == nil ? "schedule not found" : @schedules
  end

  def find_schedule(name)
    @schedules.find {|schedule| schedule.name == name}
  end

  def all_appts
    appts = []
    @schedules.each do |schedule|
      appts << schedule.appts
    end
    appts.flatten.sort_by {|appt| appt.start }
  end 
end 