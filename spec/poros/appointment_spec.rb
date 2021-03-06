require 'rails_helper'

describe "Appointments" do
  context "have" do
    it "a start and end time" do
      start_time = 5
      end_time = 10
      appt = Appointment.new(start_time, end_time)

      expect(appt.start).to eq(5) 
      expect(appt.end).to eq(10) 
    end
  end
end
