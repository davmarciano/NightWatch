class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def new
    @movie = Movie.find(params[:movie_id])
    @movie_review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    if @review.save
      redirect_to new_review_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @movie.update(params[:movie])
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @movie.destroy
  end
end
