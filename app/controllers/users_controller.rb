class UsersController < ApplicationController

	def new
		@title="Sign Up"
		@user = User.new #( :name => "foo bar", :email => "foo@bar.com", :password => "foobar", :password_confirmation => "foobar" )
	end
  
	def show
		@user=User.find(params[:id])
		@title=@user.name
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			@title="Sign Up"
			render 'new'
		end
	end
	
end
