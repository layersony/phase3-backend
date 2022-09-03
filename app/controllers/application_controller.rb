class ApplicationController < Sinatra::Base

  set default_content_type: "application/json"

  # get all hackthons
  get "/" do 
    hackathons = Hackathon.all
    hackathons.to_json()
  end 

  # get one hackthon
  get "/hackathon/:uniq_id" do 
    hackathon = Hackathon.find(params[:uniq_id])
    hackathon.to_json
  end

  # post hackathon
  post "/hackathon" do
    unique_id = rand(1...99999999)
    hackathon = Hackathon.create(
      uniq_id: unique_id,
      image_url: params[:image_url],
      topic: params[:topic],
      description: params[:description],
      location: params[:location],
      datetime: params[:datetime]
    )
    hackathon.save

    { uniq_id: unique_id,
      image_url: params[:image_url],
      topic: params[:topic],
      description: params[:description],
      location: params[:location],
      datetime: params[:datetime] }.to_json
  end 

  # put hackathon
  patch "/update/hackathon/:uniq_id" do
    hackathon = Hackathon.find_by(uniq_id: params[:uniq_id])
    hackathon.update(
      image_url: params[:image_url],
      topic: params[:topic],
      description: params[:description],
      location: params[:location],
      datetime: params[:datetime]
    )
    hackathon.to_json
  end 

  # delete hackathon
  delete '/hackathon/:uniq_id' do
    hackathon = Hackathon.find_by(uniq_id: params[:uniq_id])
    hackathon.destroy
    hackathon.to_json
  end

  # Save User
  post "/user" do
    existingUser = User.find_by(email: params[:email])
    if existingUser
      return {"message": "User already exists"}.to_json
    else
      unique_id = rand(1...9999999999)
      user = User.create(
        uniq_id: unique_id,
        fullname: params[:fullname],
        email: params[:email],
        phonenumber: params[:phonenumber],
        languages: params[:languages],
        role: params[:role]
      )
      user.save
      { uniq_id: unique_id,
        fullname: params[:fullname],
        email: params[:email],
        phonenumber: params[:phonenumber],
        languages: params[:languages],
        role: params[:role] 
      }.to_json
    end 
  end 

  # get all hackthon users
  get "/hackathon/:uniq_id/users" do
    hackthon = Hackathon.find_by(uniq_id: params[:uniq_id])
    hackthon.events.find_all do | event |
      event.user_id
    end.to_json
  end

  # register event
  post "/register/event" do
    hackathon = Hackathon.find_by(uniq_id: params[:hackathon_uniq_id])
    # check if user exists
    existingUser = User.find_by(email: params[:email])
    if existingUser
      unique_id = rand(1...9999999999)
      event = Event.create(
        user_id: existingUser.id,
        hackathon_id: hackathon.id,
      )
      event.save
      { 
        user_fullame: existingUser.fullname,
        hackathon_topic: hackathon.topic,
      }.to_json
    end
  end 
end 