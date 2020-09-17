class RelationshipsController < ApplicationController
    before_action :find_user

    def create
        current_user = User.follow(@user)
        if current_user.valid?
            render json: { confirmation: 'Following' }, status: :created
        end
    end

    def destroy
        current_user = User.unfollow(@user)
        render json: { confirmation: 'unFollowed' }
    end

    private
    
    def find_user
        @user = User.find(params[:user_id])
    end
end
