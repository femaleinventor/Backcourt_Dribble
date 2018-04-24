class Team < ApplicationRecord
  has_and_belongs_to_many :leagues
  has_one :sport, through: :leagues
  belongs_to :match
end
