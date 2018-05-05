class Team < ApplicationRecord
  has_and_belongs_to_many :leagues
  belongs_to :sport, optional: true
  belongs_to :match, optional: true
end
