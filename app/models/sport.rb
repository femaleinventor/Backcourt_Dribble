class Sport < ApplicationRecord
  has_many :leagues
  has_many :teams, through: :leagues
end
