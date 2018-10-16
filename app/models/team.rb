class Team < ApplicationRecord
  has_and_belongs_to_many :leagues
  belongs_to :sport, optional: true
  belongs_to :match, optional: true
  has_many :favorites, as: :favoritable
  # Potentially useful in the future (i.e. send a message to all fans of Sam Kerr)
  # has_many :fans, :through => :favorites, :source => :user


  def self.next(team)
    where('name < ?', team.name).last
  end

  def self.previous(team)
    where('name > ?', team.name).first
  end
end
