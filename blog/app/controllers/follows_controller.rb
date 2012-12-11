class FollowsController < ApplicationController
	before_filter :authenticate, :except => [ :index ]
	def index
		@follows = Follow.all
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @follow }
		end
	end
	def create
		#@follow = Follow.new(
		#	:follower_id => params[:follower],
		#	:followee_id => params[:followee])
		current_user = User.find(params[:follower])
		canAdd = false
		if (User.exists?(params[:followee]))
			@follow = current_user.follows.build(:followee_id => params[:followee])
			canAdd = true
		end
		#@follow = Follow.new
		#@follow[:follower_id] = params[:follower]
		#@follow[:followee_id] = params[:followee]
			
		respond_to do |format|
			if canAdd
				if @follow.save
					format.html { render :text => "Ok" } 
					format.json { render :json => @follow, :status => :created }
				else
					format.html { render :text => "Failed" } 
					format.html { render :json => @follow, :status => :error }
				end
			else
				format.html { render :text => "unknown followee id" }
			end
		end
	end
	def destroy
		u = Follow.where("follower_id = ? and followee_id = ?", params[:follower], params[:followee])
		if u.any?
			u.first.destroy	
		end
	end
	private 
       def authenticate
           render :status => :forbidden, :text => "unauthorized" unless params[:auth_token] == Blog::Application::TOKEN
       end
end
