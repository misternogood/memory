# アプリケーション名
memory ~工作物を思い出に~
# アプリケーション概要
お子様が作った作品を写真にして永久保存することで、作品を保管する場所に困らず、かつ思い出として見返すことも可能です。
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
・子供が作った作品がどんどんと増え続け、置場や処分に困っていました。毎月の様に写真を撮ってその写真を現像しアルバムを作っていましたが、今度はアルバムの置場にも困る様になりました。いっそのことアルバムの様なアプリケーションがあればと思い今回作成しました。
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1g3lLsvjfr14fOch5KpCLf-D4dDqmhtTz8PtBp0vPQBA/edit#gid=1020327293
# 実装した機能についての画像
・マイページ
[![Image from Gyazo](https://i.gyazo.com/700e36d91e8da69794a5cea76bcf9308.jpg)](https://gyazo.com/700e36d91e8da69794a5cea76bcf9308)

・新規投稿・投稿一覧
[![Image from Gyazo](https://i.gyazo.com/4040165f6c44e4328895d269da874bea.gif)](https://gyazo.com/4040165f6c44e4328895d269da874bea)

・投稿詳細ページ
[![Image from Gyazo](https://i.gyazo.com/6e640812550da063cc2ce25426b80629.jpg)](https://gyazo.com/6e640812550da063cc2ce25426b80629)
# 実装予定の機能
・お気に入り機能
・画像のプレビュー機能
# ER図
[![Image from Gyazo](https://i.gyazo.com/f516205f34730c3d6b043f0228529416.png)](https://gyazo.com/f516205f34730c3d6b043f0228529416)
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
・機能を最小限にこだわったことで動作が非常に軽いです。  
・写真を保存するアルバムの様なアプリケーションをイメージして作ったので画像を見易くしました。
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