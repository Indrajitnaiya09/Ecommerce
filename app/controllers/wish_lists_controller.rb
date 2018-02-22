class WishListsController < ApplicationController

	def index
		@wish_lists = current_user.wish_lists
	end

	def create
		@wish_list = WishList.new(wish_list_params)
		@wish_list.user_id = current_user.id
		if @wish_list.save
			redirect_to wish_lists_path, notice: "Product is successfully added in your card. "
		end
	end

	def destroy
		@wish_list = WishList.find(params[:id])
		if @wish_list.destroy
			redirect_to wish_lists_path
		end
	end

	private
	def wish_list_params
		params[:wish_list].permit(:product_id)
	end
end
