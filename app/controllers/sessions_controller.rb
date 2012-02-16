class SessionsController < ApplicationController
	def new
		@title = "Sign in"
	end
	
	def create
		user = User.authenticate( params[:session][:email], params[:session][:password] )
		
		if user.nil?
			# show error message and forward back to login page
			flash.now[:error] = "Invalid email/password :("
			@title = "Sign in"
			render :new
		else
			#store user in session and render user get action?
			sign_in user
			redirect_to user
		end
		
	end
	
	def destroy
	end
end
