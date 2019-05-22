class Appointment
  attr_reader :start, :end 
  def initialize(start_time, end_time)
    @start = start_time
    @end = end_time
  end
  
end   