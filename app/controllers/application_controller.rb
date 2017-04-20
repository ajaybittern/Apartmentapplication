class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.include? 'application/json' }
  # protect_from_forgery with: :null_session, if: ->{request.format.json?}
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  # skip_before_filter  :verify_authenticity_token
  protect_from_forgery with: :exception
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def current_user
    @current_user ||=  User.find_by(name: session[:name]) if session[:name]
  end
  helper_method :current_user
  private

  def logged_in?
    @current_user ||= User.find_by(name: session[:name])
    # return session[:name] != nil
  end

  helper_method :logged_in?

  def authorize
    redirect_to root_url unless logged_in?
  end
end
