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

  it 'can delete a schedule' do 
    post '/api/v1/schedules?name=schedule1'
    post '/api/v1/schedules?name=schedule2'
    
    delete '/api/v1/schedules?name=schedule1'

    res = JSON.parse(response.body)

    expect(res.length).to eq(1)
  end 

  it 'can show a schedules appointments' do 
    post '/api/v1/schedules?name=schedule1'
    post '/api/v1/schedules?name=schedule2'
    
    get '/api/v1/schedules/schedule1'

    res = JSON.parse(response.body)

    expect(res["data"]["type"]).to eq("schedule")
    expect(res["data"]["id"]).to be_truthy
  end 
end
