class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show follow]

  # Hamze search bar // controller index #view
  def index
    @suggested_users = []
    suggestions
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
    render layout: 'application_white'
  end

  def show
    @mymovies = current_user.movies.uniq
    @user = User.find(params[:id])
    @followers = @user.follows_by_type('User')
    @followings = @user.following_users
    @movies = @user.movies
    @watchlists = @user.watchlists
    @is_owner = current_user == @user
    @following = current_user.following?(@user)
    render layout: 'application_purple'
  end

  def follow
    @following = current_user.following?(@user)
    if @following
      current_user.stop_following(@user)
    else
      current_user.follow(@user)
    end
    redirect_to profile_path(@user)
    # render layout: 'application_purple'
  end

  private

  def set_profile
    @user = User.find(params[:id])
    # authorize @user
  end

  def suggestions
    current_user.followers.each do |follower|
      follower.followers.each do |f|
        @suggested_users << f
      end
    end

    current_user.following_by_type('User').each do |following|
      following.followers.each do |f|
        @suggested_users << f
      end
    end

    current_user.following_by_type('User').each do |following|
      following.following_by_type('User').each do |f|
        @suggested_users << f
      end
    end

    current_user.following_by_type('Watchlist').each do |watchlist|
      watchlist.followers.each do |f|
        @suggested_users << f
      end
    end
    @suggested_users.uniq!
  end
end
