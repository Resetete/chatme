class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 15}, uniqueness: { case_sensitiv: true }
  validates :email, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitiv: true }
  validates :password, presence: true

  has_many :messages
  has_secure_password
end
