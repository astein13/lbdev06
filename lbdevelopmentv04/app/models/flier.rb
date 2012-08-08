class Flier < ActiveRecord::Base
  attr_accessible :category, :community_id, :description, :image,
    :end_time, :group, :start_time, :tag, :title, :privacy_status, :channel_id, :creator_id
    validates :community_id, :presence => true
    validates :description, :presence => true
    validates :image, :presence => true
    validates :end_time, :presence => true
    validates :start_time, :presence => true
    validates :title, :presence => true
    validates :privacy_status, :presence => true

  has_many :myfliers, :dependent => :delete_all
  belongs_to :communities, :foreign_key => "community_id"
  belongs_to :channels, :foreign_key => "channel_id"

  image_accessor :image

end
