class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only:[:show, :edit, :update]

 def show
 	@user = User.find(params[:id])
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	 user = User.find(params[:id])
 	 user.update(user_params)
 	 redirect_to user_path(user.id)
 end

   private
   def user_params
   	  params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :tell, :email, :delete_date)
   end
   def correct_user
   	user = User.find(params[:id])
   	if current_user != user
   	   redirect_to root_path
   	end
   end

end
