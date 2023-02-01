class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: params[:user_id])
        if user
            render json: user, status: :ok
        else
            render json: {error: 'user does not exist'}, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user
            user.update(user_params)
            render json: user
        else
            render json: {error: 'user does not exist'}
        end
    end

    def destroy
        user = User.find(params[:id])
        if user
            user.destroy
            render json: { success: 'user deleted'}
        else
            render json: {error: 'user does not exist'}
        end
    end

    def create
        puts "user_params, #{user_params}"
        found_user = User.find_by(username: user_params[:username])
        if !found_user
        user = User.create!(user_params)
            render json: user, status: :created
        else
            render json: {error: "can not create user"}, status: :unauthorized
        end
    end


    private

    def user_params
        params.permit(:username, :password,:password_confirmation)
    end
end
