class PagesController < ApplicationController
  def home
  end

  def title
  end
 
  def restaurants
  end
  
  def index
  @restaurants = Restaurant.all
   end
end

