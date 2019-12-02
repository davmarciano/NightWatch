class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render layout: 'application_white'
    @movies = policy_scope(Movie)
  end

  def show
    render layout: 'application_purple'
    @movie = Movie.find(params[:id])
    authorize @movie
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
