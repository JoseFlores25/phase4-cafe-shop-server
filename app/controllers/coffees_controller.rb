class CoffeesController < ApplicationController
    def index
        render json: Coffee.all
    end

    def show
        coffees = Coffee.where(user_id:params[:user_id]).reverse_order
        if coffees
            render json: coffees
        else 
            render json: {error: 'coffee does not exist'}
        end
    end

    def update
        coffee = Coffee.find(params[:id])
        if coffee
            coffee.update(coffee_params) 
            coffees = Coffee.where(user_id:params[:user_id]).reverse_order
            render json: coffees
        else 
            render json: {error: 'coffee does not exist'}
        end
    end
    
    def destroy
        coffee = Coffee.find(params[:id])
        if coffee 
            coffee.delete
            coffees = Coffee.where(user_id:params[:user_id]).reverse_order
            render json: coffees, status: :created
        else 
            render json: {error: 'coffee does not exist'}
        end
    end

    def create
        coffee = Coffee.create!(coffee_params)
        coffees = Coffee.where(user_id:coffee_params[:user_id]).reverse_order

        if coffee.valid?
            render json: coffees, status: :created
        else 
            render json: {error: 'can not create a coffee '}, status: :unprocessable_entity
        end
    end


    private

    def coffee_params
        params.permit(:name, :price, :description, :image,  :coffee_type, :user_id)
    end
end