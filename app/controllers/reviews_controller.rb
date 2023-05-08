class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    # Display the form to add a new review to a specific restaurant
    @review = Review.new
  end

  def create
    # Create a new review for a specific restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
