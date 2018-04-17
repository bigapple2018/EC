class Admins::UsersController < ApplicationController


 def show
 	@user = User.find(params[:id])
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	 user = User.find(params[:id])
 	 user.updaet(user_params)
 	 redirect_to user_path(user.id)
 end


end
