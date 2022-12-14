class Record < ApplicationRecord
  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :title, :content
    validates :created_date, presence: { message: 'を選択してください' }
  end
  belongs_to :creator
  has_one_attached :image

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
