class ReviewsController < ApplicationController
  before_action :find_product

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      render :new
    end
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
