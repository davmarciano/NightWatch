class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :watchlist_movies

  validates :title, uniqueness: true

  def friend_reviews(current_user)
    reviews.select { |review| current_user.follows.pluck(:followable_id).include?(review.user_id) }
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
