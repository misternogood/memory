class Record < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :creator
end
