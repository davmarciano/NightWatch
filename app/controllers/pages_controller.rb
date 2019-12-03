class PagesController < ApplicationController
  layout 'application_home'
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end
end
