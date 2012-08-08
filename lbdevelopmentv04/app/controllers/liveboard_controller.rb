class LiveboardController < ApplicationController
  def index
    @community_id = current_user.community_id
    @community_name = Community.find_by_id(@community_id).name
    @community = Community.find_by_id(@community_id)
    @public_fliers = @community.public_fliers
    @current_user_added_fliers = current_user.added_fliers
    @current_user_created_fliers = current_user.created_fliers
    @fliers_for_adding = @public_fliers - (current_user.added_fliers + current_user.created_fliers)
    @channels = Channel.all

  end
end
