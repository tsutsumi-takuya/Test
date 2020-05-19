class ShopsController < ApplicationController

	before_action :authenticate_user!

	def index
		@photos = Photo.all
		@photo = Photo.new
		@user = current_user
	end
end
