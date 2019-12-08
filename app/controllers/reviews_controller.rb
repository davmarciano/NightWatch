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
      respond_to do |format|
        format.html { redirect_to movie_path(@movie) } # we do not really expect html, but only JS
        format.js  # <-- idem
      end
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
