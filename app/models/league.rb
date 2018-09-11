class League < ApplicationRecord
  belongs_to :sport, optional: true
  has_many :matches
  has_and_belongs_to_many :teams
  has_many :predictions, through: :matches


  def self.next(league)
    where('name < ?', league.name).last
  end

  def self.previous(league)
    where('name > ?', league.name).first
  end
end
