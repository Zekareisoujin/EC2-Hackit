class UsersController < ApplicationController
   
   before_filter :authenticate, :except => [ :index, :new, :create, :login ]
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
               format.html { render :text => "ok" }
               format.json { render :json => @user, :status => :created, 
                                                    :location => @post }
           else
               format.html { render :text => "server error" }
               format.json { render :json => @post.errors,
                                             :status => :unprocessable_entity }
           end
       end
   end
   def login
       u = User.where("name = ? and password = ?",params[:name],params[:password])
       respond_to do |format|
           if u.any?
               format.html { render :json => [:id => u.first[:id], :token => Blog::Application::TOKEN] }
           else
               format.html { render :text => "invalid username/password"}
           end
       end
   end
   def new_post
       @post = Post.new
       respond_to do |format|
           format.html
       end
   end
   def post_media
       @post = Post.new(params[:post])
       user_id = params[:user_id]
       u = User.where("id = ?",user_id)
       respond_to do |format|
           if u.any?
               @post.user_id = user_id
               if @post.save
                   format.html { render :json => @post }
               else
                   format.html { render :json => @post.errors }
               end
           else
               format.html { render :text => "invalid user" }
           end
       end
   end
   private 
       def authenticate
           render :status => :forbidden, :text => "unauthorized" unless params[:auth_token] == Blog::Application::TOKEN
       end
end
