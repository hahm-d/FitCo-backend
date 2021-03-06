class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    before_action :find_post, only: [ :show, :destroy, :update, :getComments]

    def index 
        posts = Post.all
        posts = posts.sort_by{ |post| [post.created_at, post.updated_at].max }.reverse!
        render json: posts, include: [:image, :video]
    end

    def show 
        sortedPost = @post.comments.sort_by{ |comment| [comment.created_at, comment.updated_at].max }.reverse!
        render json: sortedPost.as_json
    end

    def create 
        post = Post.new(post_params)
        post.poster_id = current_user.id

        post.image.attach(io: image_io, filename: 'image.png')
        
        if post.save
            render json: post, include: [:image, :video], status: :created
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
        params.require(:post).permit(:title, :content, :url, :views, :likes, :image, :video)
    end

    def image_io
        decoded_image = Base64.decode64(params[:image])
         StringIO.new(decoded_image)
    end
    
    def video_io
        decoded_video = Base64.decode64(params[:video])
         StringIO.new(decoded_video)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
