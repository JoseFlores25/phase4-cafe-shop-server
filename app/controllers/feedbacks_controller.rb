class FeedbacksController < ApplicationController
    def index
        feedbacks = Feedback.where(coffee_id: params[:coffee_id]).reverse_order
        if feedbacks
            render json: feedbacks
        else
            render json: {error: 'feedbacks does not exist'}
        end
    end

    def show
        feedbacks = Feedback.where(coffee_id: params[:coffee_id]).reverse_order
        if feedbacks
            render json: feedbacks
        else
            render json: {error: 'feedbacks does not exist'}
        end
    end
    def update
        feedbacks = Feedback.find(params[:id])
        if feedbacks
            feedbacks.update(feedbacks_params)
            render json: feedbacks
        else
            render json: {error: 'feedbacks does not exist'}
        end
    end

    def destroy
        feedback = Feedback.find(params[:id])
        puts "feedback[:user_id] #{feedback[:user_id] == params[:user_id]}"
        if feedback && feedback[:user_id] == params[:user_id]
            feedback.destroy
            feedbacks = Feedback.where(coffee_id: params[:coffee_id]).reverse_order
            render json: feedbacks
        elsif !feedback
            render json: {error: 'feedback does not exist'}, status: :bad_request
        else render json: {error: 'you cant delete this feedback, it does not belog to you'}, status: :bad_request
        end
    end

    def create
        feedback = Feedback.create!(feedback_params)
        if feedback.valid?
            render json: feedback
        else
            render json: {error: 'can not create feedback'}
        end
    end


    private

    def feedback_params
        params.permit(:title, :description, :id, :user_id, :coffee_id)
    end
end
