class UsersController < ApplicationController
   def index
       @users = User.all

       respond_to do |format|
           format.html # index.html.erb
	   format.json { render :json => @users }
       end
   end
   def new
       @user = User.new

       respond_to do |format|
           format.html # new.html.erb
           format.json { render :json => @user }
       end  
   end
   def create
       @user = User.new(params[:user])

       respond_to do |format|
           if @user.save
               format.html { redirect_to(@user,:notice => 'ok') }
               format.json { render :json => @user, :status => :created, 
                                                    :location => @post }
           else
               format.html { render :action => "new" }
               format.json { render :json => @post.errors,
                                             :status => :unprocessable_entity }
           end
       end
   end
end
