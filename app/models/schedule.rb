class Schedule
  attr_reader :appts, :name
  
  def initialize(name)
    @appts = []
    @name = name
  end

  def add_appt(start_time, end_time)
    if start_time < end_time && !overlap?(start_time, end_time)
      appt = Appointment.new(start_time, end_time)
      @appts << appt
      @appts = @appts.sort_by {|appt| appt.start}
    elsif overlap?(start_time, end_time)
      "Appointments cannot overlap"
    else
      "start time must be smaller than endtime"
    end 
  end

  def del_appt(start_time)
    new_appts = @appts.reject! {|appt| appt.start == start_time}
    "appointment not found" if new_appts == nil
  end

  def overlap?(start_time, end_time)
    t = @appts.any? do |appt|
      start_time.between?(appt.start, appt.end) || end_time.between?(appt.start, appt.end)
    end
  end 
end 