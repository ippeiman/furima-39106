# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| tel                | integer | null: false |

## Product Information（商品） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| Product ID               | integer  | null: false |
| Product Name             | string   | null: false |
| Description              | text     | null: false |
| Price                    | integer  | null: false |
| Stock Quantity           | integer  | null: false |

## Order Information（注文） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| Order ID                 | integer  | null: false |
| User ID                  | integer  | null: false |
| Order Date and Time      | datetime | null: false |
| Total Amount             | integer  | null: false |

## Order Details（注文詳細） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| Order ID                 | integer  | null: false |
| Product ID               | integer  | null: false |
| Quantity                 | integer  | null: false |

## Shopping Cart（カート） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| Cart ID                  | integer  | null: false |
| Product ID               | integer  | null: false |
| User ID                  | integer  | null: false |
| Quantity                 | integer  | null: false |


## Transaction History（取引履歴） テーブル

| Column                          | Type      | Options     |
| ------------------              | ------    | ----------- |
| Transaction ID                  | integer   | null: false |
| Order ID                        | integer   | null: false |
| User ID                         | integer   | null: false |
| Payment Method                  | string    | null: false |
| Shipping Method                 | string    | null: false |
| Shipping Address                | string    | null: false |
| Transaction Date and Time       | datetime  | null: false |

## Favorite Product（お気に入り） テーブル

| Column                   | Type     | Options     |
| ------------------       | ------   | ----------- |
| Product ID               | integer  | null: false |
| User ID                  | integer  | null: false |