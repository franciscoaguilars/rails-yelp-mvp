class ReviewsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.rating = @review.rating.to_i
        # we need `restaurant_id` to associate review with corresponding restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review.restaurant = @restaurant
        raise
        if @review.save
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end
    
    private
    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
