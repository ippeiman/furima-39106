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
- has_many :order_informations

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
| delivary_day_id         | integer     | null: false |
| user                     | references  | null: false,foreign_key: true |

## アソシエーション
- belongs_to :user
- has_one :order_information


## order_informations（注文） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| user                     | references  | null: false,foreign_key: true |
| item                     | references  | null: false,foreign_key: true |
## アソシエーション
- belongs_to :item
- has_one :postage
- belongs_to :user


## postages（発送） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| post_code                | string      | null: false |
| shipping_area_id         | integer     | null: false |
| municipalities           | string      | null: false |
| house_number             | string      | null: false |
| building_name            | string      |             |
| phone_number             | string      | null: false |
| order_information        | references  | null: false,foreign_key: true |

## アソシエーション
- belongs_to :order_information