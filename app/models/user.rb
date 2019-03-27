class User < ApplicationRecord

  has_many :pictures
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

end
