class ReviewsController < ApplicationController

  before_filter :authorize

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

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:product_id]
    redirect_to [@product], notice: 'Review deleted!'
  end

  private
  def review_params
      params.require(:review).permit(:rating, :description)
  end

end
