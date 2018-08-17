class Prediction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :match, optional: true
  belongs_to :sport, optional: true

  validates :guess, presence: { message: "Guess field cannot be blank" }
  validates :reason, presence: { message: "Reason field cannot be blank" }
end
