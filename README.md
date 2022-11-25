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