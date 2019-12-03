class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
    render layout: 'application_purple'
  end

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    @review.user = current_user
      authorize @review
    if @review.save
      redirect_to movie_path(@movie)
    else
      flash[:alert] = "Sorry, something went wrong."
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

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
