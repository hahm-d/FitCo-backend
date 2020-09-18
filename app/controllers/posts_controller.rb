class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    before_action :find_post, only: [ :show, :destroy, :update, :getComments]

    def index 
        posts = Post.all
        posts = posts.sort_by{ |post| [post.created_at, post.updated_at].max }.reverse!
        render json: posts.to_json
    end

    def show 
        render json: @post.to_json, include: :comments
    end

    def create 
        post = current_user.posts.create(post_params)
        if post.valid?
            render json: post.to_json, status: :created
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end

    def update
        @post.update(post_params)
        if @post.valid?
            render json: current_user.posts.to_json
        else
            render json: { error: 'failed to edit post' }, status: :not_acceptable
        end
    end

    def destroy 
        @post.destroy
        render json: current_user.posts.to_json
    end

    def getComments
        render json: @post.comments.to_json
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :url, :views, :likes, :poster_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
