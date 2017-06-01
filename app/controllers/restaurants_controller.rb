class RestaurantsController < ApplicationController
	def show
	@restaurant = Restaurant.find(params[:id])
	end
	
	def index
    @restaurants = Restaurant.all
    end
	
	def new
	end
	
	def create
	@restaurant = Restaurant.new(params.require(:restaurants).permit(:name, :address, :phone, :food_genre))
 
    if @restaurant.save
    redirect_to @restaurant
    else
    render 'new'
	end
	end
	
	
	private
	def restaurant_params
	params.require(:restaurants).permit(:name, :address, :phone, :food_genre)
	end
	
end
