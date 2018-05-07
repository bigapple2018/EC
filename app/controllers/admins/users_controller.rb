class Admins::UsersController < ApplicationController

 def index
	@q = User.ransack(params[:q])
  @users = @q.result.order(created_at: :desc).page(params[:page]).per(2)
 end

 def search
  @q = User.search(search_params)
  @users = @q.result(distinct: true)
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
 	 	user.update(admin_user_params)
 	 	redirect_to admins_user_path(user.id)
	 else
 	 	redirect_to user_path(user.id)
 	end
 end


private
   def admin_user_params
   	  params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :tell, :delete_date, :email, :password)
   end

   def search_params
	    params.require(:q).permit(:name_cont)
   end

end

