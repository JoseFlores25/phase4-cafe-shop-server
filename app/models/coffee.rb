class Coffee < ApplicationRecord
  has_many :toppings
  has_many :feedbacks
end
