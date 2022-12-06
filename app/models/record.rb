class Record < ApplicationRecord
  with_options presence: true do

  validates :image, presence:{message: "を選択してください" }
  validates :title, :content
  end
  belongs_to :creator
  has_one_attached :image
end
