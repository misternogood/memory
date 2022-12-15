# アプリケーション名
memory ~ 工作物を思い出に ~
# アプリケーション概要
お子様が作った作品を写真にして永久保存することで、作品を保管する場所に困らず、かつ思い出として見返すことも可能です。
# URL
http://35.75.212.47/
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
作者の詳細画面から新規投稿ボタンで投稿画面に遷移し、画像・タイトル・説明・作成日・タグを入力し投稿する。
## お気に入り機能
投稿の詳細画面から投稿のお気に入りの登録、解除が行えます。  
さらにマイページからお気に入り一覧画面に遷移できます。
## 画像のプレビュー機能
作者登録画面や新規投稿画面にて画像を選択した際に、選択した画像をプレビューで表示し選択した画像がわかりやすく表示されています。
# アプリケーションを作成した背景
・子供が作った作品がどんどんと増え続け、置場や処分に困っていました。毎月の様に写真を撮ってその写真を現像しアルバムを作っていましたが、今度はアルバムの置場にも困る様になりました。いっそのことアルバムの様なアプリケーションがあればと思い今回作成しました。
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1g3lLsvjfr14fOch5KpCLf-D4dDqmhtTz8PtBp0vPQBA/edit#gid=1020327293
# 実装した機能についての画像
・マイページ
[![Image from Gyazo](https://i.gyazo.com/4ab653ab607d75d3fbbd0d200d8b2839.png)](https://gyazo.com/4ab653ab607d75d3fbbd0d200d8b2839)

・新規投稿
[![Image from Gyazo](https://i.gyazo.com/3a099d6ecbd82c74e6a67c17188f1312.gif)](https://gyazo.com/3a099d6ecbd82c74e6a67c17188f1312)

・投稿一覧
[![Image from Gyazo](https://i.gyazo.com/2f6c33ae310a59d97b8b517d26cb5869.png)](https://gyazo.com/2f6c33ae310a59d97b8b517d26cb5869)
・投稿詳細ページ
[![Image from Gyazo](https://i.gyazo.com/6e640812550da063cc2ce25426b80629.jpg)](https://gyazo.com/6e640812550da063cc2ce25426b80629)
# 実装予定の機能
・お気に入り機能
・画像のプレビュー機能
# ER図
[![Image from Gyazo](https://i.gyazo.com/af053b74d01079f2ebfe4904377f87eb.png)](https://gyazo.com/af053b74d01079f2ebfe4904377f87eb)
# 開発環境
・フロントエンド  
・バックエンド  
・インフラ  
・テスト  
・テキストエディタ  
# ローカルでの動作方法
・以下のコマンドを順に実行。  
% git clone https://github.com/misternogood/memory.git  
% cd projects  
% cd memory  
% bundle install  
% yarn install  
% rails s
# 工夫したポイント
・ サイト全体的な配色をこだわり見やすいレイアウトに仕上げました。
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