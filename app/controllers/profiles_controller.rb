class ProfilesController < ApplicationController
  layout "application_purple"


  def show
    @user = User.find(params[:id])
    @movies = @user.movies
    @watchlists = @user.watchlists
    @is_owner = current_user == @user
    # @following = following?
  end

  private

  def set_profile
    @user = User.find(params[:id])
    authorize @user
  end

  # def following?
  #   current_user.follow?(@user)
  # end
end
