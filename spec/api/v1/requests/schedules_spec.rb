require 'rails_helper'

context "CRUD schedules" do
  it 'can create a schedule' do 
    post '/api/v1/schedules?name=schedule1'

    res = JSON.parse(response.body)
    
    expect(res[0]["name"]).to eq("schedule1")
  end 

  it 'can read all the schedules' do 
    post '/api/v1/schedules?name=schedule1'
    post '/api/v1/schedules?name=schedule2'
    
    get '/api/v1/schedules'

    res = JSON.parse(response.body)
    
    expect(res.length).to eq(2)
  end 
end
