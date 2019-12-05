class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :by_friends, ->(user) { where(user: user.all_following.pluck(:id))}
  scope :by_friends_and_me, ->(user) { where(user: [user.all_following.pluck(:id), user.id].flatten)}

end
