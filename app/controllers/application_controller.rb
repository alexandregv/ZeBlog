class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  helper_method :current_user
  
  
  private
  
  def only_signed_in
    if !current_user
        redirect_to new_user_path, danger: 'Vous devez vous connecter pour accéder à cette page.'
    end
  end

  def current_user 
    return nil if !session[:user] || !session[:user]['id'] 
    return User.find(session[:user]['id']) 
  end
  
end
