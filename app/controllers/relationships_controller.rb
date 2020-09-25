class RelationshipsController < ApplicationController
    before_action :find_user

    def create
        coach = User.find(params[:coach_id])
        if @user.following?(coach)
            render json: { confirmation: 'failed request - already following'}
        else
            @user.follow(coach)
            render json: coach, status: :created
        end
    end

    def destroy
        coach = User.find(params[:coach_id])
        if @user.following?(coach)
            @user.unfollow(coach)
            render json: coach, status: :created
        else
            render json: { confirmation: 'failed request'}
        end
    end

    private

    def find_user
        @user = User.find(params[:user_id])
    end
end
