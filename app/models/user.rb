class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :watchlists, dependent: :destroy
  has_many :movies, through: :watchlists

  acts_as_follower
  acts_as_followable

  after_create :create_default_watchlists

  mount_uploader :profile_picture, PhotoUploader

  def friends
    follows.map do |follow|
      if follow.followable_type == "User"
        User.find(follow.followable_id)
      end
    end
  end

  private

  def create_default_watchlists
    Watchlist.create(user: self, name: "My Movies")
    Watchlist.create(user: self, name: "Watch Later")
  end

end
