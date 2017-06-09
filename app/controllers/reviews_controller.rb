class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to @review.product, notice: 'Whale was successfully created.'
    else
      redirect_to @review.product, notice: 'Failed to create the whale'
    end
  end

  private
  def review_params
      params.require(:review).permit(:rating, :description)
  end

end
