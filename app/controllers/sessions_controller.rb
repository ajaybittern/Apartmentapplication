class SessionsController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def create
    user=User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:name] = user.name
      redirect_to '/listings/index'
    else
      redirect_to root_url, :notice => 'name or password is not valid!'
    end
  end

  def destroy
    session[:name]=nil
    redirect_to root_url
  end

  def show
    if session[:name]!=nil
      redirect_to '/listings/index'

    end
  end

end