# README
# テーブル設計

## users テーブル
| Column                | Type    | Option      |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birth_date            | string  | null: false |

### Association
- belongs_to :items
- belongs_to :record

## address テーブル
| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefectures   | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| phone_number  | string  | null: false |

### Association
- has_one :record

## items テーブル
| Column     | Type     | Option      |
| ---------- | -------- | ----------- |
| image      | text     | null: false |
| name       | string   | null: false |
| comment    | text     | null: false |
| category   | string   | null: false |
| condition  | string   | null: false |
| burden     | string   | null: false |
| area       | string   | null: false |
| day        | string   | null: false |
| price      | integer  | null: false |

### Association
- has_many :users
- has_one :record

## record
| Column  | Type       | Option |
| ------- | ---------- | ------ |
| user    | references |        |
| address | references |        |
| item    | references |        |

### Association
- has_many :user
- has_one :address
- has_one :items