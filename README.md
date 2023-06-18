# テーブル設計

## users テーブル

| Column                    | Type      | Options                   |
| ------------------        | ------    | -----------               |
| name                      | string    | null: false               |
| email                     | string    | null: false, unique: true |
| encrypted_password        | string    | null: false               |
| first_name                | string    | null: false               |
| last_name                 | string    | null: false               |
| first_name_katakana       | string    | null: false               |
| last_name_katakana        | string    | null: false               |
| birth_date                | date      | null: false               |

## items（商品） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| name                     | string   | null: false |
| description              | text     | null: false |
| price                    | integer  | null: false |
| category_id              | integer  | null: false,foreign_key: true |
| item_id                  | integer  | null: false |
| seller_id                | integer  | null: false |
| shipping_area            | integer  | null: false |
| delivary_days            | integer  | null: false |


## orders_information（注文） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| user                     | references  | null: false,foreign_key: true |

## postages（発送） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| post_code                | string   | null: false |
| prefecture_id            | integer  | null: false |
| house_number             | string   | null: false |
| building_name            | string   |             |
| phone_number             | string   | null: false |
| user_id                  | references  | null: false,foreign_key: true |