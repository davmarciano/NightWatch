class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR movies.actors ILIKE :query
      OR movies.directors ILIKE :query  OR movies.genres ILIKE :query"
      @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
      render layout: 'application_white'
    else
      @movies = policy_scope(Movie)
      render layout: 'application_white'
    end
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
    @reviews = @movie.friend_reviews(current_user) + current_user.reviews.where(movie: @movie)
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
