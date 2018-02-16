class Sport < ApplicationRecord
  has_many :tweeters, dependent: :destroy
  validates :name, presence: true
end
