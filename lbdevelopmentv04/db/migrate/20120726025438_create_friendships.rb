class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.string :user1
      t.string :user2

      t.timestamps
    end
  end

  def self.down
    drop_table :friendships
  end

end
