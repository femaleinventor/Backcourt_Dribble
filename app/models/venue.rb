class Venue < ApplicationRecord
  belongs_to :match, optional: true

  def self.next(venue)
    where('name < ?', venue.name).last
  end

  def self.previous(venue)
    where('name > ?', venue.name).first
  end
end
