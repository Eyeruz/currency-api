class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    
    has_many :currencies
    has_many :currency_histories
end