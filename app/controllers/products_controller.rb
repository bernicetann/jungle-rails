class ProductsController < ApplicationController

  # before_filter :authorize

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = @product.reviews.order("updated_at DESC")
    @new_review = Review.new

  end

end
