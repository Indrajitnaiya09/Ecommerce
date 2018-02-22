class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.save
			#redirect_to product_path(@review.product), notice: "Thank you for adding your review"
		
	end

	def edit
		@review = Review.find(params[:id])
	end

	def show
		@review = Review.find(params[:id])
		@product = @review.product
	end

	def update
		@review = Review.find(params[:id])
		@review.user_id = current_user.id
		if @review.update_attributes(review_params)
			redirect_to review_path(@review.id)
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		#redirect_to product_path(@review.product_id), notice: "You have successfully deleted the review"
	end

	private

	def review_params
		params[:review].permit(:body, :rating, :product_id)
	end
	
end
