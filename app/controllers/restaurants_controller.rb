class RestaurantsController < ApplicationController
  def index
    # Display the list of all restaurants
    @restaurants = Restaurant.all
  end

  def new
    # Display the form to add a new restaurant
    @restaurant = Restaurant.new
  end

  def create
    # Create a new restaurant and redirect to its show view
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.build
    @reviews = @restaurant.reviews
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
