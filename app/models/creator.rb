class Creator < ApplicationRecord
  with_options presence: true do
  validates :name
  validates :birth_date, presence:{message: "を選択してください" }
  validates :image, presence:{message: "を選択してください" }
  end

  belongs_to :user
  has_many :records, dependent: :destroy
  has_one_attached :image
end
