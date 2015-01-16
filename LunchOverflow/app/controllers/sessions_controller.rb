class SessionsController < ApplicationController

  def create
    @user = User.find_by(user_name: params[:session][:user_name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render text: 'user logged in'
    else
      render text: 'user not logged in'
    end
  end

end