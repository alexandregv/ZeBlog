class SessionsController < ApplicationController

    before_action :only_signed_out, only: [:new, :create]

    def new
    end

    def create
        user_params = params.require(:user)
        @user = User.where(name: user_params[:name]).or(User.where(mail: user_params[:name])).first
        
        if @user and @user.authenticate(user_params[:password])
            if @user.confirmed
                session[:user] = @user.get_session
                redirect_to edit_user_path(@user.id), success: 'Connexion réussie.'
            else
                # TODO: Créer une vue de confirmation et rediriger dessus
                redirect_to root_path, success: 'Vous devez valider votre compte pour pouvoir vous connecter.'
            end
        else
            redirect_to new_session_path, danger: 'Indentifiants incorrects.'
        end
    end

    def destroy
        session.delete :user
        
        redirect_to new_session_path, success: 'Vous êtes maintenant déconnecté.'
    end
    
end
