class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :file_thumbnail, :file_url, :likes, :loc_lat, :loc_long, :title, :views

  validates :description, :presence => true
  validates :title, :presence => true
end
