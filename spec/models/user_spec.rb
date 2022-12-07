require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '登録必須項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
  context '新規登録できない時'
  # ニックネーム
  it 'nicknameが空では登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include('ニックネームを入力してください')
  end
  # メールアドレス
  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
  end
  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
  end
  it 'emailは@を含まないと登録できない' do
    @user.email = 'tanaka.com'
    @user.valid?
    expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
  end
  # パスワード
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードを入力してください')
  end
  it 'passwordが5文字以下では登録できない' do
    @user.password = '1111a'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
  end
  it 'passwordが129文字以上では登録できない' do
    @user.password = Faker::Internet.password(min_length: 129)
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
  end
  it 'passwordが半角英字のみでは登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
  end
  it 'passwordが半角数字のみでは登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
  end
  it 'passwordに全角文字を含むと登録できない' do
    @user.password = '全角password'
    @user.password_confirmation = '全角password'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
  end
  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '11111a'
    @user.password_confirmation = '1111aa'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
  end
end
