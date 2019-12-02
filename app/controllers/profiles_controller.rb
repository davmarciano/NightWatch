class ProfilesController < ApplicationController
  def show
    render layout: 'application_purple'
    @user = User.find(params[:id])
    authorize @user
  end
end
