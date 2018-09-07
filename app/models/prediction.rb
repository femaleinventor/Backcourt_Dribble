class Prediction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :match, optional: true
  belongs_to :sport, optional: true

  validates :guess, presence: true
  validates :reason, presence: true
  validates :user, presence: true

end
