require 'rails_helper'

describe "Schedule" do
  context "has" do
    it "appointments" do
      schedule = Schedule.new

      expect(schedule.appts).to eq([])
    end
  end
  context "can" do
    it 'create appointments' do
      schedule = Schedule.new

      expect(schedule.appts.length).to eq(0)  

      schedule.add_appt(5, 10)

      expect(schedule.appts[0].class).to eq(Appointment)  
      expect(schedule.appts.length).to eq(1)
    end

    it 'read appointments' do
      schedule = Schedule.new

      expect(schedule.appts.length).to eq(0)  

      schedule.add_appt(5, 10)

      expect(schedule.appts[0].start).to eq(5)  
      expect(schedule.appts[0].end).to eq(10)  
    end

    it 'delete appointments' do 
      schedule = Schedule.new

      schedule.add_appt(5, 10)
      schedule.add_appt(11, 12)
      expect(schedule.appts.length).to eq(2)  
      
      schedule.del_appt(5)

      expect(schedule.appts.length).to eq(1)  
      expect(schedule.appts[0].start).to_not eq(5)
    end 

    it 'render error if deleted appt not found' do 
      schedule = Schedule.new

      schedule.add_appt(5, 10)
      schedule.add_appt(11, 12)
      expect(schedule.appts.length).to eq(2)  
      
      expect(schedule.del_appt(42)).to eq("appointment not found")
      
      expect(schedule.appts.length).to eq(2)  
    end 
  end
  
end
