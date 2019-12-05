class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :watchlists, dependent: :destroy
  has_many :movies, through: :watchlists
  has_many :reviews, dependent: :destroy

  acts_as_follower
  acts_as_followable

  after_create :create_default_watchlists
  before_destroy :remove_all_follows

  mount_uploader :profile_picture, PhotoUploader

  include PgSearch::Model
  pg_search_scope :search_friend,
  against: [:first_name, :last_name],

  using: {
    tsearch: { prefix: true }
  }

  def friends
    my_friends = []
    follows.each do |follow|
      if follow.followable_type == "User"
        user = User.find(follow.followable_id)
        my_friends << user unless user.nil?
      end
    end
    my_friends
  end

  private

  def create_default_watchlists
    # Watchlist.create(user: self, name: "My Movies")
    Watchlist.create(user: self, name: "Watch Later")
  end

  def remove_all_follows

  end

end
