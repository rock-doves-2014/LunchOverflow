class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.authenticate(params[:user][:password]) && @user.save 
      session[:user_id] = @user.id
      render text: 'user created'
    else
      render text: 'failed user creation'
    end

  end

    private
  
    def user_params
      params.require(:user).permit(:user_name, :email, :password)
    end
end
