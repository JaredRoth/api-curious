class UsersController < ApplicationController
  def show
    @user = current_user
    @info = @user.info
  end

  def following
    @user = current_user
  end

  def activity
    @info = current_user.followed_activity(params[:username])
  end
end
