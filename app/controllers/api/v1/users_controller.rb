class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:update, :user_stats, :user_following, :user_followers, :retrieve_coach_posts]
    skip_before_action :authorized, only: [:index, :coach_index, :retrieve_coach_posts, :create, :update, :destroy]

    def index
      users = User.all
      render json: users.to_json(only: [:id, :username, :status, :flag])
    end

    def coach_index
      coaches = User.all.select{ |user| user[:flag] == true}
      render json: coaches.to_json(only: [:id, :username, :email, :instagram, :twitter, :status, :description, :flag]), include: :comments
    end

    def user_following
      following = @user.following
      render json: following.to_json(only: [:id, :username, :email, :instagram, :twitter, :status, :description, :flag])
    end

    def user_followers
      followers = @user.followers
      render json: followers.to_json(only: [:id, :username, :email, :status, :description, :flag])
    end

    def retrieve_coach_posts
      posts = @user.posts
      posts = posts.sort_by{ |post| [post.created_at, post.updated_at].max }.reverse!
      render json: posts.to_json 
    end

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
   
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
   
    def update
      @user.update_attribute(:email, user_edit_params[:email])
      @user.update_attribute(:instagram, user_edit_params[:instagram])
      @user.update_attribute(:twitter, user_edit_params[:twitter])
      @user.update_attribute(:status, user_edit_params[:status])
      @user.update_attribute(:description, user_edit_params[:description])
        render json: { user: UserSerializer.new(@user)}
    end

    def user_stats
      render json: @user.user_stats.to_json
    end

    private
      def user_params
        params.require(:user).permit(:username, :password, :email, :instagram, :twitter, :status, :description, :flag, :avatar)
      end

      def user_edit_params
        params.require(:user).permit(:email, :instagram, :twitter, :status, :description, :flag, :avatar)
      end

      def find_user
        @user = User.find(params[:id])
      end

    end
