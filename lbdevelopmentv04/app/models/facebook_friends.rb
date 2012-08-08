class FacebookFriends < ActiveRecord::Base
  belongs_to :user
  validates  :user_fbid, :friend_fbid, :facebook_created_at, :presence => true

def self.graph
   @graph ||= Koala::Facebook::GraphAPI.new(access_token)
end

def self.update_friends_for_user!(user, opts={})
  results = graph.get_connections(user.fbid, 'friends', opts)
  loop do
    results.each do |hash|
      unless user.facebookfriends.exists?(:user_fbid => current_user.id, :friend_fbid => hash['id'] )
        user.facebookfriends.create!(
        :user_fbid => current_user.fbid,
        :friend_fbid => hash['id'],
        :facebook_created_at => hash["created_time"])

      end
    end
    break if results.nil?
  end
end

def self.real_time_update!(payload)
  RealtimeUpdate.new(payload).enqueue_updates!
end

class RealtimeUpdate < Struct.new(:payload)

  def enqueue_updates!
    remove_duplicate_uids.each do |entry|
      if (user = Authentication.find_by_uid_and_provider(entry['uid']), 'facebook'.try(:user))
        Resque.enqueue(ResqueJob::UpdateFacebookFriends, user.id, :since => entry['time'])
      end
    end
  end

  protected

  def remove_duplicate_uids
    payload['entry'].each_with_object({}) do |entry, hash|
      hash[entry['uid']] ||= [] << entry
    end.values.collect { |update_payloads| update_payloads.min {|entry1, entry2| entry1['time']<=>entry2['time']}}
  end
 end
end


