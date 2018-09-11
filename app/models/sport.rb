class Sport < ApplicationRecord
  has_many :leagues
  has_many :teams
  has_many :matches, through: :leagues
  has_many :predictions, through: :matches

  def self.next(sport)
    where('name < ?', sport.name).last
  end

  def self.previous(sport)
    where('name > ?', sport.name).first
  end
end
