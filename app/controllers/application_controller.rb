class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  helper_method :current_usern, :user_signed_in?
  
  
  private
  
  def only_signed_in
    if !current_user
        redirect_to new_user_path, danger: 'Vous devez vous connecter pour accéder à cette page.'
    end
  end
  
  def user_signed_in?
    !current_user.nil?
  end

  def current_user 
    return nil if !session[:user] || !session[:user]['id']
    return @_user if @_user
    @_user = User.find_by_id(session[:user]['id']) 
  end
  
end
