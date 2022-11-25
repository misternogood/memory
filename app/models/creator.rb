class Creator < ApplicationRecord
  
  validates :name, :birth_date, presence: true

  belongs_to :user
end
