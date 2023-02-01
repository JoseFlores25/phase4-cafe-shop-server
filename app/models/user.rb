class User < ApplicationRecord
    has_secure_password
    has_many :feedbacks, through: :coffees
end
