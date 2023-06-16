# テーブル設計

## users テーブル

| Column                    | Type      | Options                   |
| ------------------        | ------    | -----------               |
| name                      | string    | null: false               |
| email                     | string    | null: false, unique: true |
| encrypted_password        | string    | null: false               |
| first_name                | string    | null: false               |
| familly_name              | string    | null: false               |
| birth_date                | datetime  | null: false               |

## Items（商品） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| name                     | string   | null: false |
| description              | text     | null: false |
| price                    | integer  | null: false |
| item_condition           | integer  | null: false |
| brand                    | integer  |             |


## Orders Information（注文） テーブル

| Column                   | Type        | Options     |
| ------------------       | ------      | ----------- |
| order_id                 | references  | null: false,foreign_key: true |
| user_id                  | references  | null: false,foreign_key: true |
| order_date_and_time      | datetime    | null: false |
| total_amount             | integer     | null: false |

## postages（発送） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| post_code                | string   | null: false |
| city                     | string   | null: false |
| house_number             | string   | null: false |
| building_name            | string   | null: false |
| phone_number             | string   | null: false, unique: true |