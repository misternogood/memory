class Creator < ApplicationRecord
  validates :name, :birth_date, presence: true

  belongs_to :user
  has_one_attached :image
end