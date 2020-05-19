class ShopsController < ApplicationController

	before_action :authenticate_user!

	def index
		@shops = Shop.all
		@shop = Shop.new
		@user = current_user
	end

	def show
		@shop = Shop.find(params[:id])
		@user = User.find(current_user.id)
		@like = Like.new
		@shop_comment = ShopComment.new
		@shop_comments = @shop.shop_comments
		# @shopに紐付くshop_comments
	end

	def new
		@shop = Shop.new
	end

	def edit
		@shop = Shop.find(params[:id])
		if
			@shop.user_id === current_user.id
			render action: :edit
			# @shop.user_idがcurrent_user.idの場合のみ編集が可能
		else
			redirect_to shops_path
			# 上記以外の場合、一覧へ戻る
		end
	end

	def update
		@shop = Shop.find(params[:id])
		@shop.update(shop_params)
		if
			@shop.save
			redirect_to shops_path(@shop.id)
			# @shopがsaveされた場合、編集後のshopにpath
		else
			@user = current_user
			@shops = Shop.all
			render action: :edit
			# 上記以外の場合、編集画面に戻る
		end
	end

	def destroy
		shop = Shop.find(params[:id])
		shop.destroy
		redirect_to shops_path
		# shop単体を削除する為、@は付属しない
	end

end
