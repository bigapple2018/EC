class AdminsController < ApplicationController

def top
end

def index
	@users = User.all
end

end
