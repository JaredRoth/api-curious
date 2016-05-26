class UsersController < ApplicationController
  def show
    @user = current_user
    @user_info = @user.info
    
  end
end
