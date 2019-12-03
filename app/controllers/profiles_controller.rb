class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
    # render layout: 'application_purple'
  end

  def follow
    set_profile
    unless current_user == @user
      if following?
        current_user.stop_following(@user)
      else
        current_user.follow(@user)
      end
    end
  end

  private

  def set_profile
    @user = User.find(params[:id])
    authorize @user
  end

  def following?
    current_user.follow?(@user)
  end
end
