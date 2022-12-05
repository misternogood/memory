require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe '作者新規登録' do
    context '新規登録できる時' do
      it '登録必須項目が存在すれば登録できる' do
        expect(@record).to be_valid
      end
    end
  end
  context '新規登録できない時'
  # タイトル
  it 'titleが空では登録できない' do
    @record.title = ''
    @record.valid?
    expect(@record.errors.full_messages).to include("Title can't be blank")
  end
  # 説明
  it 'contentが空では登録できない' do
    @record.content = ''
    @record.valid?
    expect(@record.errors.full_messages).to include("Content can't be blank")
  end
  # 画像
  it 'imageが空では登録できない' do
    @record.image = nil
    @record.valid?
    expect(@record.errors.full_messages).to include("Image can't be blank")
  end
  # 作者
  it 'creatorが紐づいていなければ登録できない' do
    @record.creator = nil
    @record.valid?
    expect(@record.errors.full_messages).to include('Creator must exist')
  end
end
