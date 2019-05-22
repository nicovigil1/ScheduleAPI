class Schedule
  attr_reader :appts, :name
  
  def initialize(name)
    @appts = []
    @name = name
  end

  def add_appt(start_time, end_time)
    appt = Appointment.new(start_time, end_time)
    @appts << appt
  end

  def del_appt(start_time)
    new_appts = @appts.reject! {|appt| appt.start == start_time}
    "appointment not found" if new_appts == nil
  end

end 