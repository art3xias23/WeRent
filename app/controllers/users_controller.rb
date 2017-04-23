class UsersController < ApplicationController

	def index  
			@users = User.all
	
	end 


	def show
		@user = User.find(params[:id])
		@rooms = @user.rooms
	end 

	def edit
		@user = User.find(params[:id])
	end 

	def update
			@user = User.find(params[:id])
	     if @user.update(user_params)
	       redirect_to root_path
	     else
	       render 'edit'
	     end
   
	end 


private 
	def admin
		user=User.create(:email =>"werentauser@gmail.com", :password =>"qqqqqq")
		user.admin=true
		user.save!
	end 

	def user_params
    	params.require(:user).permit(:email, :description, :phone_number, :fullname)
  	end

end 