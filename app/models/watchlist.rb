class Watchlist < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user, dependent: :destroy
  has_many :watchlist_movies
  has_many :movies, through: :watchlist_movies

  acts_as_followable
end
