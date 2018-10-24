class Player < ApplicationRecord
  has_many :favorites, as: :favoritable
  # Potentially useful in the future (i.e. send a message to all fans of Sam Kerr)
  # has_many :fans, :through => :favorites, :source => :user
end
