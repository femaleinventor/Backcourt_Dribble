class Match < ApplicationRecord
  belongs_to :league
  has_one :home_team, :class_name => 'Team'
  has_one :away_team, :class_name => 'Team'
  belongs_to :sport
  belongs_to :venue
  has_many :predictions
end
