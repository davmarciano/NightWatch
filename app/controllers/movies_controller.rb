class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @movies = policy_scope(Movie)
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
  end
end
