class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user, dependent: :destroy
end
