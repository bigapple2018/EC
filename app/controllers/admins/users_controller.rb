class Admins::UsersController < ApplicationController

 def index
	@users = User.page(params[:page]).reverse_order .search(params[:search])
 end


 def show
 	@user = User.find(params[:id])
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	 user = User.find(params[:id])
 	 if admin_signed_in?
 	 	user.updaet(admin_user_params)
 	 	redirect_to admins_user_path(user.id)
	 else
 	 	redirect_to user_path(user.id)
 	end
 end


private
   def admin_user_params
   	  params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :tell, :delete_date, :email, :password)
   end

end

