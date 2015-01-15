class Users_controller < ApplicationController

  def new
    @user = User.new
  end
end
