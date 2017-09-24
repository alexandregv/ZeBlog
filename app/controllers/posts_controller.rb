class PostsController < ApplicationController

    before_action :set_post, only: [:show, :update, :destroy, :edit]
    before_action :only_signed_in, only: [:new, :edit, :update]

    def index
        @posts = Post.published.new_to_old.all
        
        respond_to do |format|
           format.html
           format.json { render json: @posts.as_json(only: [:id, :name]) }
        end
    end
    
    
    def show
        respond_to do |format|
            format.html
            format.json { render json: @post }
        end
    end
    
    
    def edit
    end
    
    
    def update
        if @post.update(post_params)
            redirect_to post_path(@post.id), success: 'Article modifé avec succès'
        else
            render :edit
        end
    end
    
    
    def new
        @post = Post.new
    end
    
    
    def create
        post = Post.new(post_params)
        post.author = current_user.name
        if post.valid?
            post.save
            redirect_to post_path(post.id), success: 'Article créé avec succès'
        else
            @post = post
            render :new
        end
    end
    
    
    def destroy
        @post.destroy
        redirect_to posts_path, success: 'Article supprimé avec succès'
    end
    
    
    
    private
    
    def post_params
        params.require(:post).permit(:name, :slug, :category_id, :content, :published)
    end
    
    def set_post
        @post = Post.find(params[:id])
    end


end
