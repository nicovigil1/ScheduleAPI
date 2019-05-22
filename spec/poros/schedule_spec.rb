require 'rails_helper'

describe "Schedule" do
  context "has" do
    it "appointments" do
      schedule = Schedule.new("name1")

      expect(schedule.appts).to eq([])
    end

    it "a name" do 
      schedule = Schedule.new("name1")

      expect(schedule.name).to eq("name1")
    end 
  end
  context "can" do
    it 'create appointments' do
      schedule = Schedule.new("name1")

      expect(schedule.appts.length).to eq(0)  

      schedule.add_appt(5, 10)

      expect(schedule.appts[0].class).to eq(Appointment)  
      expect(schedule.appts.length).to eq(1)
    end

    it 'read appointments' do
      schedule = Schedule.new("name1")

      expect(schedule.appts.length).to eq(0)  

      schedule.add_appt(5, 10)

      expect(schedule.appts[0].start).to eq(5)  
      expect(schedule.appts[0].end).to eq(10)  
    end

    it 'delete appointments' do 
      schedule = Schedule.new("name1")

      schedule.add_appt(5, 10)
      schedule.add_appt(11, 12)

      expect(schedule.appts.length).to eq(2)  
      
      schedule.del_appt(5)

      expect(schedule.appts.length).to eq(1)  
      expect(schedule.appts[0].start).to_not eq(5)
    end 

    it 'render error if deleted appt not found' do 
      schedule = Schedule.new("name1")

      schedule.add_appt(5, 10)
      schedule.add_appt(11, 12)
      expect(schedule.appts.length).to eq(2)  
      
      expect(schedule.del_appt(42)).to eq("appointment not found")
      
      expect(schedule.appts.length).to eq(2)  
    end 
  end

  context 'can validate' do 
    it 'start time is smaller than end time' do
      schedule = Schedule.new("name1")

      expect(schedule.add_appt(10, 5)).to eq("start time must be smaller than endtime")
      expect(schedule.appts).to eq([])
    end

    it 'schedules dont overlap' do 
      schedule = Schedule.new("name1")

      schedule.add_appt(1, 5)

      expect(schedule.add_appt(3, 6)).to eq("Appointments cannot overlap")
    end 
  end 
end
