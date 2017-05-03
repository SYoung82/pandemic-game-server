class User < ApplicationRecord
    has_many :games, dependent: :destroy

    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
