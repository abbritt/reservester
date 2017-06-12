class RestaurantsController < ApplicationController
	
	#makes sure that only the restaurant owner can edit
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  	before_action :check_owner, only: [:edit, :update, :destroy]
  	before_action :authenticate_b_user!, only: [:edit, :update, :new, :create]	
	
	
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
	
	def edit
  	end
	

	
	def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  	end
  
 	 def destroy
    @restaurant.destroy
    render 'index'
 	 end
		
	
	
	
	private
	def restaurant_params
	params.require(:restaurants).permit(:name, :address, :phone, :food_genre)
	end
	
	def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def check_owner
    redirect_to(restaurants_url, notice: 'Wrong owner.') if @restaurant.b_user != current_owner
  end
	
end
