class Sport < ApplicationRecord
  has_many :leagues
  has_many :teams
  has_many :matches, through: :leagues
  has_many :predictions, through: :matches
end
