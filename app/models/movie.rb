class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :watchlist_movies

  validates :title, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_anything,
  against: [:title, :watchlist, :actor, :director, :genre],

  using: {
    tsearch: { prefix: true }
  }

  def friend_reviews(current_user)
    reviews.by_friends(current_user)
  end

  def friends_average_rating(current_user)
    reviews = friend_reviews(current_user)
    if reviews.empty?
      0
    else
      reviews.pluck(:rating).sum / reviews.length
    end
  end
end
