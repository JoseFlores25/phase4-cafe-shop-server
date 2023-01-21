class ToppingsController < ApplicationController

    def index
        render json: Topping.all
    end

    def show
        toppings = Topping.where(coffee_id: toppings_params[:coffee_id]).reverse_order
        if toppings
            render json: toppings
        else 
            render json: {error: 'toppings does not exist'}
        end
    end
    def update
        toppings = Topping.find(params[:id])
        if toppings
            toppings.update(toppings_params) 
            render json: toppings
        else 
            render json: {error: 'toppings does not exist'}
        end
    end
    
    def destroy
        toppings = Topping.find(params[:id])
        if toppings  
            toppings.destroy
            render json: { success: 'toppings deleted'}
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
