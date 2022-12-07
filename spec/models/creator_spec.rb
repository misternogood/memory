require 'rails_helper'

RSpec.describe Creator, type: :model do
  before do
    @creator = FactoryBot.build(:creator)
  end

  describe '作者新規登録' do
    context '新規登録できる時' do
      it '登録必須項目が存在すれば登録できる' do
        expect(@creator).to be_valid
      end
    end
  end
  context '新規登録できない時'
  # 作者名
  it 'nameが空では登録できない' do
    @creator.name = ''
    @creator.valid?
    expect(@creator.errors.full_messages).to include('作者名を入力してください')
  end
  # 生年月日
  it 'birth_dateが空では登録できない' do
    @creator.birth_date = ''
    @creator.valid?
    expect(@creator.errors.full_messages).to include('生年月日を選択してください')
  end
  # 画像
  it 'imageが空では登録できない' do
    @creator.image = nil
    @creator.valid?
    expect(@creator.errors.full_messages).to include('作者画像を選択してください')
  end
  # ユーザー
  it 'ユーザーが紐づいていなければ登録できない' do
    @creator.user = nil
    @creator.valid?
    expect(@creator.errors.full_messages).to include('Userを入力してください')
  end
end
