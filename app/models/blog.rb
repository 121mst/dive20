class Blog < ActiveRecord::Base
  validates :content, presence: true
  mount_uploader :image, PictureUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
end
