require "rails_helper"

describe "CRUD Appointments" do
  it 'can create an appointment' do 
    post '/api/v1/schedules?name=schedule1'
    post '/api/v1/appointments/schedule1?start=1&end=2'

    res = JSON.parse(response.body)

    expect(res[0]["start"]).to eq("1")
    expect(res[0]["end"]).to eq("2")
  end

  it 'can read all appointments' do 
    post '/api/v1/schedules?name=schedule1'
    post '/api/v1/schedules?name=schedule2'
    post '/api/v1/appointments/schedule1?start=1&end=2'
    post '/api/v1/appointments/schedule2?start=3&end=4'

    get '/api/v1/appointments'

    res = JSON.parse(response.body)

    expect(res[0]["start"]).to eq("1")
    expect(res[0]["end"]).to eq("2")
    expect(res[1]["start"]).to eq("3")
    expect(res[1]["end"]).to eq("4")
  end

  it 'delete an appointment' do 
    post '/api/v1/schedules?name=schedule1'
    post '/api/v1/schedules?name=schedule2'
    post '/api/v1/appointments/schedule1?start=1&end=2'
    post '/api/v1/appointments/schedule2?start=3&end=4'
    
    delete '/api/v1/appointments/schedule2?start=3'

    res = JSON.parse(response.body)

    expect(res.length).to eq(1)
    expect(res[0]["start"]).to eq("1")
    expect(res[0]["end"]).to eq("2")
  end
end
