class UsersController < ApplicationController
  before_action :set_user, except: [:activity]

  def show
    @info = @user.info
    @orgs = @user.orgs
  end

  def following
  end

  def activity
    @info = current_user.followed_activity(params[:username])
  end

  def repos
  end

  private

    def set_user
      @user = current_user
    end
end
