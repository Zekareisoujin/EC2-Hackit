class Follow < ActiveRecord::Base
  #attr_accessible :follower_id, :followee_id
  belongs_to :user
  belongs_to :followee, :class_name => "User", :foreign_key => "followee_id"
  
#  def new(follower_id, followee_id)
#	self.follower_id = follower_id
#	self.followee_id = followee_id
#  end
end
