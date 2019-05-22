require 'rails_helper'

describe "Manager" do
  context "can" do
    it 'create & read schedules' do 
      manager = Manager.new
      
      expect(manager.schedules).to eq([]) 

      manager.add_schedule("name1")
      
      expect(manager.schedules[0].class).to eq(Schedule)
      expect(manager.schedules[0].name).to eq("name1")
      expect(manager.schedules.length).to eq(1)
    end

    it 'delete schedules' do
      manager = Manager.new

      manager.add_schedule("name1")
      
      expect(manager.schedules.length).to eq(1)

      manager.delete_schedule("name1")

      expect(manager.schedules.length).to eq(0)
    end 

    it 'render error upon deletion of unfound schedule' do
      manager = Manager.new

      manager.add_schedule("name1")
      
      expect(manager.schedules.length).to eq(1)

      expect(manager.delete_schedule("noname")).to eq("schedule not found")

      expect(manager.schedules.length).to eq(1)
    end 
  end
  
end
