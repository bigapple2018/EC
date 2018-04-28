class LeavesController < ApplicationController
    before_action :authenticate_user!

	def new
		@leave = Leave.new
	end
	def create
		leave = Leave.new(leave_params)
		leave.user_id = current_user.id
		if leave.save
		   leave = User.find(current_user.id)
		   leave.destroy
		   leave.update(email: leave.delete_date.to_i.to_s + '_' + leave.email.to_s)
		   redirect_to root_path
	    else
	    	@leave = leave
	    	render "leaves/new"
	    end
	end


	private
	def leave_params
		params.require(:leave).permit(:leave_reason)
	end
end
