class Follow < ActiveRecord::Base
  belong_to :user
  belong_to :followee, :class_name => "User", :foreign_key => "followee_id"
end
