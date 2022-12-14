class RecordForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :title, :content, :image, :created_date, :creator_id, :id, :created_at, :updated_at

  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :title, :content
    validates :created_date, presence: { message: 'を選択してください' }
  end

  def save
    Record.create(title: title, content: content, image: image, created_date: created_date, creator_id: creator_id)
  end

  def update(params, record)
    record.update(params)
  end
end