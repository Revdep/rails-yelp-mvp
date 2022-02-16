class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def destroy
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant

    @review.destroy

    redirect_to @restaurant
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
