class Team < ApplicationRecord
  has_and_belongs_to_many :leagues
  belongs_to :sport, optional: true
  belongs_to :match, optional: true

  def self.next(team)
    where('name < ?', team.name).last
  end

  def self.previous(team)
    where('name > ?', team.name).first
  end
end
