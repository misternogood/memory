# アプリケーション名
memory ~工作物を思い出に~
# アプリケーション概要
お子様が作った作品を写真にして永久保存することで、作品を保管する場所に困らず、かつ思い出として見返すことも可能になる。
# URL
https://memory-ekqq.onrender.com/
# テスト用アカウント
・ Basic認証ID : admin<br>
・ Basic認証パスワード : 2222<br>
・ メールアドレス1 : aaa@email.com<br>
・ パスワード1 : aaa111<br>
・ メールアドレス2 : bbb@email.com<br>
・ パスワード2 : bbb222<br>
# 利用方法
## ユーザーの登録
トップページのヘッダーからユーザーの新規登録を行う
## 作者の登録
ヘッダーからユーザーのマイページに遷移しマイページで作者の新規登録を行う
## 思い出の投稿
作者の詳細画面から新規投稿ボタンで投稿画面に遷移し、画像・タイトル・説明を入力し投稿する。
# アプリケーションを作成した背景

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1g3lLsvjfr14fOch5KpCLf-D4dDqmhtTz8PtBp0vPQBA/edit#gid=1020327293
# 実装した機能についての画像
・マイページ

# 実装予定の機能
・お気に入り機能
# ER図

# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| email              | string       | null: false, unique: true      |
| encrypted_password | string       | null: false, default: ""       |
| nickname           | string       | null: false                    |

### Association

- has_many :creators

## creators テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| name                   | string       | null: false                    |
| birth_date             | date         | null: false                    |
| user                   | references   | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_many :records

## records テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| title                  | string       | null: false                    |
| content                | text         | null: false                    |
| creator                | references   | null: false,foreign_key: true  |

### Association

- belongs_to :creator