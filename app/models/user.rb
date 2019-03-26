class User < ApplicationRecord

  has_many :pictures
  validates :name, presence: true

end
