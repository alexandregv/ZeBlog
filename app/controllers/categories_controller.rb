class CategoriesController < ApplicationController

    before_action :set_category, only: [:show, :update, :destroy, :edit]
    before_action :only_signed_in, only: [:new, :edit, :update]

    def index
        @categories = Category.all
    end


    def show
        @posts = @category.posts.published.new_to_old.all
    end


    def update
        if @category.update(category_params)
            redirect_to category_path(@category.id), success: 'Catégorie modifée avec succès'
        else
            render :edit
        end
    end


    def destroy
        @category.destroy
        redirect_to categories_path
    end


    def new
        @category = Category.new
    end
    
    
    def create
        @category = Category.create(category_params)
        redirect_to category_path(@category.id)
    end
    
    
    def edit
    end
    
    
    
    private
    
    def category_params
        params.require(:category).permit(:name, :slug)    
    end
    
    def set_category
        @category = Category.find(params[:id])
    end

end
