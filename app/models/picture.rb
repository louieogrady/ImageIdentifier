class Picture < ApplicationRecord

  belongs_to :user
  has_many :comments
  validates :name, presence: true
  mount_uploader :attachment, AttachmentUploader


end
