class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true, index: true
  belongs_to :user
end
