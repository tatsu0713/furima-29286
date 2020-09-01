# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル

| Column                |  Type   | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| kanji_family_name     | string  | null: false |
| kanji_first_name      | string  | null: false |
| kana_family_name      | string  | null: false |
| kana_first_name       | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column           |  Type      | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| item_burden_id   | integer    | null: false                    |
| delivery_area_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| selling_price    | integer    | null: false                    |


### Association
- belongs_to :user
- has_many :item_purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :item_burden
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :shipping_day



## item_purchases テーブル

| Column  |  Type      | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address



## delivery_addresses テーブル

| Column           |  Type      | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_number      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |

### Association
- belongs_to :item_purchase
- belongs_to_active_hash :prefecture
