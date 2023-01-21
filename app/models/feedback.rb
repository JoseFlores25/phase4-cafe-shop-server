class Feedback < ApplicationRecord
  belongs_to :coffee
  belongs_to :user
end
