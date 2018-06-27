class Sport < ApplicationRecord
  has_many :leagues
  has_many :teams
  has_many :matches, through: :leagues
end
