class Record < ApplicationRecord
  belongs_to :creator
  has_one_attached :image
  has_many :record_tag_relations, dependent: :destroy
  has_many :tags, through: :record_tag_relations
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
