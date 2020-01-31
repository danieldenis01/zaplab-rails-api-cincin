class User < ApplicationRecord
  validates :email, presence: true
  validates :email, format: { with:  /[^\s]@[^\s]/, allow_blank: true }
  validates :email, uniqueness: true

  has_secure_password
end
