class PagesController < ApplicationController
   skip_before_filter :logged_in_check
   layout false
  def welcome
    @channels = Channel.all
  end

  def contact
    @channels = Channel.all
  end

  def help
    @channels = Channel.all
  end

  def about
    @channels = Channel.all
  end

  def press
    @channels = Channel.all
  end
end
