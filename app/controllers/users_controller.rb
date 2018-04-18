class UsersController < ApplicationController
 def show
 	@user = User.find(params[:id])
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	 user = User.find(params[:id])
 	 user.update(user_params)
 	if admin_signed_in?
 	 	redirect_to admins_user_path(user.id)
	 else
 	 	redirect_to user_path(user.id)
 	end
	 
 end

   private
   def user_params
   	  params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :tell, :delete_date, :email, :password)
   end
end
