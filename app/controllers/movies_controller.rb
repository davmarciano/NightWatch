class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @movies = policy_scope(Movie)
    render layout: 'application_white'
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
    @reviews = @movie.friend_reviews(current_user)
    @friends_average_rating = @movie.friends_average_rating(current_user)
    render layout: 'application_purple'
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
    authorize @movie
  end
end
