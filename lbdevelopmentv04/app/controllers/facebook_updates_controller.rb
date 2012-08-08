class FacebookUpdatesController < ApplicationController

  VERIFY_TOKEN = "bryantheturtle"

  layout nil
  
  def create

    FacebookFriends.real_time_update!(params)
    render :text => 'success'

  end

  def index
    Rails.logger.info("FacebookUpdatesController verification")
    render :text=> Koala::Facebook::RealtimeUpdates.meet_challenge(params, VERIFY_TOKEN)
  end

  
end
