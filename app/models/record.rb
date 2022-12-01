class Record < ApplicationRecord
  validates :title, :content, :image, presence: true

  belongs_to :creator
  has_one_attached :image
end
