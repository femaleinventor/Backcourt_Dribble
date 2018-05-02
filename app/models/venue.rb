class Venue < ApplicationRecord
  belongs_to :match, optional: true
end
