class Match < ApplicationRecord
  belongs_to :league, optional: true
  belongs_to :sport, optional: true
  belongs_to :venue, optional: true
  has_many :predictions, dependent: :destroy

  validates :time_zone, presence: true

  def self.next(match)
    where('start < ?', match.start).last
  end

  def self.previous(match)
    where('start > ?', match.start).first
  end
end
