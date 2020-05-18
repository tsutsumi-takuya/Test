class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
		@photos = @user.photos
		# @userに紐付く@photos
	end
end
