class Watchlist < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :watchlist_movies, dependent: :destroy
  has_many :movies, through: :watchlist_movies

  acts_as_followable

  validates :name, presence: true
end
