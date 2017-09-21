class PagesController < ApplicationController

    def accueil
        @posts = Post.published.new_to_old.limit(3)
        
        respond_to do |format|
           format.html
           format.json { render json: @posts.as_json(only: [:id, :name]) }
        end
    end

end
