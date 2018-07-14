class League < ApplicationRecord
  belongs_to :sport, optional: true
  has_many :matches
  has_and_belongs_to_many :teams
end
