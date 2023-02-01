class ToppingsController < ApplicationController

    def index
        toppings = Topping.where(coffee_id: toppings_params[:coffee_id]).reverse_order
        if toppings
            render json: toppings
        else
            render json: {error: 'toppings does not exist'}
        end
    end

    def create
        Topping.create!(toppings_params)
        toppings = Topping.where(coffee_id: toppings_params[:coffee_id]).reverse_order
        if toppings
            render json: toppings
        else
            render json: {error: 'can not create coffee toppings'}
        end
    end


    private

    def toppings_params
        params.permit(:name, :coffee_id )
    end
end
