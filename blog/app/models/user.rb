class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :name, :password, :profile_pic

  validates :name, :presence => true
  validates :password, :presence => true,
                       :length => { :minimum => 5 }
end
