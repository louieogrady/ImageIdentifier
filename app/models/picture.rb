class Picture < ApplicationRecord

  belongs_to :user
  has_many :comments
  validates :name, presence: true
  mount_uploader :attachment, AttachmentUploader


  def percent_of(n)
   self.to_f / n.to_f * 100.0
  end


end
