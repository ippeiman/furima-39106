# テーブル設計

## users テーブル

| Column                    | Type      | Options     |
| ------------------        | ------    | ----------- |
| nickname                  | string    | null: false |
| email                     | string    | null: false, unique: true |
| encrypted_password        | string    | null: false |
| first_name                | string    | null: false |
| last_name                 | string    | null: false |
| first_name_katakana       | string    | null: false |
| last_name_katakana        | string    | null: false |
| birth_date                | date      | null: false |

## アソシエーション
- has_many :items
- has_many :postages

## items（商品） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| name                     | string      | null: false |
| description              | text        | null: false |
| price                    | integer     | null: false |
| category_id              | integer     | null: false |
| condition_id             | integer     | null: false |
| shipping_cost_id         | integer     | null: false |
| shipping_area_id         | integer     | null: false |
| delivary_day_id          | integer     | null: false |
| user                     | references  | null: false,foreign_key: true |

## アソシエーション
- belongs_to :user
- has_one :postage


## postages（発送） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| user                     | references  | null: false,foreign_key: true |
| item                     | references  | null: false,foreign_key: true |
## アソシエーション
- belongs_to :item
- has_one :payment
- belongs_to :user


## payments（支払い者情報） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| post_code                | string      | null: false |
| shipping_area_id         | integer     | null: false |
| city                     | string      | null: false |
| house_number             | string      | null: false |
| building_name            | string      |             |
| phone_number             | string      | null: false |
| postage                  | references  | null: false,foreign_key: true |

## アソシエーション
- belongs_to :postage