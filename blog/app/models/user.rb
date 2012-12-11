class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :name, :password, :profile_pic

  validates :name, :presence => true
  validates :password, :presence => true,
                       :length => { :minimum => 5 }
					   
  has_many :follows
  has_many :followees, :through => :follows, :source => :followee
  has_many :inverse_follows, :class_name => "Follow", :foreign_key => "follower_id"
  has_many :followers, :through => :inverse_follows, :source => :follower
end
