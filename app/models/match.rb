class Match < ApplicationRecord
  belongs_to :league, optional: true
  belongs_to :sport, optional: true
  belongs_to :venue, optional: true
  has_many :predictions

  by_star_field :start
end
