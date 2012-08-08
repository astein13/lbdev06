class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
    @channel = Channel.find_by_id(params[:channel_id])
    @fliers = Flier.find_all_by_channel_id(params[:channel_id])
    @channel_name = @channel.channel
  end
end
