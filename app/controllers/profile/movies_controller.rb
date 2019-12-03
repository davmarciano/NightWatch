class Profile::MoviesController < ApplicationController
   layout 'application_white'
  def index
    @mymovies = current_user.movies.uniq
  end
end
