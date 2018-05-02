class Match < ApplicationRecord
  belongs_to :league, optional: true
  has_one :home_team, :class_name => 'Team'
  has_one :away_team, :class_name => 'Team'
  belongs_to :sport, optional: true
  belongs_to :venue, optional: true
  has_many :predictions
end
