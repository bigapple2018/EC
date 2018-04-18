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
	 redirect_to user_path(user.id)
 end

   private
   def user_params
   	  params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :tell, :delete_date, :email, :password)
   end
end
