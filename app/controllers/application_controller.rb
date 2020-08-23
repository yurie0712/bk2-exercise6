class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  def search
    method = params[:search_method]
    word = params[:search_word]
    @books = Book.search(method,word)
  end

  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
