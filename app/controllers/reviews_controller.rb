class ReviewsController < ApplicationController
  def create
    @product=Product.find params[:product_id]
    @review=@product.reviews.new(review_params)

    if @review.save
      redirect_to @product, notice: 'Review created!'
    else
      redirect_to :back, notice: 'Review cannot be created! Please check if you have filled the required fields'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :user_id
    )
  end
end
