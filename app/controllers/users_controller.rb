class UsersController < ApplicationController

    before_action :only_signed_in, only: [:edit, :update]


    def new
        @user = User.new
    end
    
    
    def create
        user_params = params.require(:user).permit(:name, :mail, :password, :password_confirmation)
        @user = User.new(user_params)
        
        if @user.valid?
            @user.save
            UserMailer.confirm(@user).deliver_now
            redirect_to root_path, success: 'Votre compte a bien été créé. Merci de le valider.'
        else
            render 'new'
        end
    end
    
    
    def confirm
        @user = User.find(params[:id])
        
        if @user.confirmation_token == params[:token]
            @user.confirmed = true
            @user.confirmation_token = nil
            @user.save(validate: false)
            
            session[:user] = {id: @user.id}
            
            redirect_to edit_user_path(@user.id), success: "Votre compte a bien été confirmé."
        else
            # TODO: Créer une vue de confirmation et rediriger dessus
            redirect_to new_user_path, danger: "Le token de validation n'est pas valide."
        end
    end
    
    
    def edit
        @user = User.find(session[:user]['id'])
        
        if @user.id.to_s != params[:id]
            redirect_to new_user_path, danger: "Vous n'avez pas accès à cette page."
        end
    end
    
    
    def update
    
    end
    
    
end