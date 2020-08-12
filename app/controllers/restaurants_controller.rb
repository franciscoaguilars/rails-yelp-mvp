class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(strong_params)
        @restaurant.save
        
        redirect_to restaurant_path(@restaurant.id)
    end

    private
    def strong_params
        params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end