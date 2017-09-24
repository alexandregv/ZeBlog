class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  helper_method :current_usern, :user_signed_in?
  
  
  private
  
  def only_signed_in
    redirect_to new_session_path, danger: 'Vous devez vous connecter pour accéder à cette page.' unless current_user
  end

  def only_signed_out
    redirect_to root_path, danger: "Vous n'avez pas le droit d'accéder à cette page." if user_signed_in?
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
