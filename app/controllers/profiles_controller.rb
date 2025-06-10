class ProfilesController < ApplicationController
  def new
  end

  def create
    @user = params[:user] # hash parameters
    @hobbies = params[:hobbies] # array parameters

    # Parse JSON from string input
    begin
      @preferences = JSON.parse(params[:preferences_json])
    rescue JSON::ParseError=> e
      @preferences = { error: "Invalid JSON: #{e.message}" }
    end
    render :show
  end
end
