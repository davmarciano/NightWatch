class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR movies.actors ILIKE :query
      OR movies.directors ILIKE :query  OR movies.genres ILIKE :query"
      @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
      render layout: 'application_white'
    else
      @top_rated_movies = policy_scope(Movie).joins(:reviews).select("movies.id, movies.poster, movies.title, avg(reviews.rating) as average_rating").group("movies.id").order("average_rating DESC")
      render layout: 'application_white'
    end
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
    @reviews = @movie.friend_reviews(current_user) + current_user.reviews.where(movie: @movie)
    @friends_average_rating = @movie.friends_average_rating(current_user)
    set_background_image
    @saved = current_user.watchlists.first.movies.include?(@movie)
    render layout: 'application_purple'
  end

  def saved
    @movie = Movie.find(params[:id])
    if current_user.watchlists.first.movies.include?(@movie)
      WatchlistMovie.where(watchlist: current_user.watchlists.first, movie: @movie).first.destroy
    else
      WatchlistMovie.create!(watchlist_id: current_user.watchlists.first.id, movie_id: @movie.id)
    end
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def set_background_image
    if @movie.background.nil?
      url = URI("https://api.themoviedb.org/3/movie/#{@movie.imdb_id}/images?api_key=#{ENV['IMDB_TOKEN']}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request.body = "{}"

      response = http.request(request).read_body
      file_path = JSON.parse(response)["backdrops"][0]["file_path"]

      @movie.background = "https://image.tmdb.org/t/p/original#{file_path}"
      @movie.save
    end
  end
end
