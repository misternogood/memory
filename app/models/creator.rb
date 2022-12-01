class Creator < ApplicationRecord
  validates :name, :birth_date, :image, presence: true

  belongs_to :user
  has_many :records, dependent: :destroy
  has_one_attached :image
end
