class Record < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :creator
  has_one_attached :image
end
