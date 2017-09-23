class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  
  
  private
  def only_signed_in
    if !session[:user] || !session[:user]['id']
        redirect_to new_user_path, danger: 'Vous devez vous connecter pour accéder à cette page.'
    end
  end
  
end
