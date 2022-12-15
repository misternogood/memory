class Tag < ApplicationRecord
  has_many :record_tag_relations
  has_many :records, through: :record_tag_relations
  validates :tag_name, uniqueness: true
end
