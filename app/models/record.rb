class Record < ApplicationRecord
  belongs_to :creator
  has_one_attached :image

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
