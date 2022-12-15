class RecordForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :title, :content, :image, :created_date, :creator_id, :id, :created_at, :updated_at, :tag_name

  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :title, :content
    validates :created_date, presence: { message: 'を選択してください' }
  end

  def save
    record = Record.create(title: title, content: content, image: image, created_date: created_date, creator_id: creator_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    RecordTagRelation.create(record_id: record.id, tag_id: tag.id)
  end

  def update(params, record)
    record.record_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    record.update(params)
    RecordTagRelation.create(record_id: record.id, tag_id: tag.id) if tag_name.present?
  end
end