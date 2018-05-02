class Prediction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :match, optional: true
end
