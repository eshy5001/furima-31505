# README
# テーブル設計

## users テーブル
| Column                | Type    | Option      |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birth_date            | date    | null: false |

### Association
- belongs_to :item
- belongs_to :record

## address テーブル
| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefectures   | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association
- has_one :record

## items テーブル
| Column       | Type     | Option      |
| ------------ | -------- | ----------- |
| name         | string   | null: false |
| comment      | text     | null: false |
| category_id  | integer  | null: false |
| condition_id | integer  | null: false |
| burden_id    | integer  | null: false |
| area_id      | integer  | null: false |
| day_id       | integer  | null: false |
| price        | integer  | null: false |

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
- has_many :users
- has_one :address
- has_one :items