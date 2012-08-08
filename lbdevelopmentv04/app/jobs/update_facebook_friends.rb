class Resque::Job::UpdateFacebookFriends
  @queue = "facebook_friends"

  def self.perform(user_id, opts={})
    :Timeout.timeout(1800) do
      FacebookFriends.update_friends_for_user!(User.find(user_id), opts)
    end
  end
end