class FollowsController < ApplicationController
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
		@follow = current_user.follows.build(:followee_id => params[:followee])
			
		respond_to do |format|
			if @follow.save
				flash[:notice] = "Ok"
				format.json { render :json => @follow, :status => :created }
			else
				flash[:error] = "Failed"
				format.html { render :json => @follow, :status => :error }
			end
		end
	end
end
