class ShopCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		photo = Photo.find(params[:photo_id])
		photo_comment = Comment.new(comment_params)
		photo_comment.user_id = current_user.id
		photo_comment.photo_id = photo.id
		photo_comment.save
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	def destroy
		photo = Photo.find(params[:photo_id])
		photo_comment =Comment.find_by(user_id: current_user.id, photo_id: params[:photo_id])
		photo_comment.user_id = current_user.id
		photo_comment.photo_id = photo.id
		photo_comment.destory
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	private

	def photo_comment_params
		params.require(:comment).permit(:comment)
	end

end
