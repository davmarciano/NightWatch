class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    render layout: 'application_purple'
  end
end
