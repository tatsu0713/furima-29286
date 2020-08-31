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
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| kanji_name            | string  | null: false |
| kana_name             | string  | null: false |
| birthday              | integer | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column        |  Type      | Options                        |
| ------------- | ---------- | ------------------------------ |
| email         | references | null: false, foreign_key: true |
| password      | references | null: false, foreign_key: true |
| image         | string     | null: false                    |
| item_name     | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| item_status   | string     | null: false                    |
| item_burden   | string     | null: false                    |
| delivery_area | string     | null: false                    |
| shipping_day  | string     | null: false                    |
| selling_price | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase



## purchases テーブル

| Column           |  Type      | Options                        |
| ---------------- | ---------- | ------------------------------ |
| email            | references | null: false, foreign_key: true |
| password         | references | null: false, foreign_key: true |
| card_information | integer    | null: false                    |
| expiration_day   | integer    | null: false                    |
| security_code    | integer    | null: false                    |

### Association
- belongs_to :item
- has_one :delivery_address



## delivery_addresses テーブル

| Column           |  Type      | Options                        |
| ---------------- | ---------- | ------------------------------ |
| email            | references | null: false, foreign_key: true |
| password         | references | null: false, foreign_key: true |
| post_number      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |

### Association
- belongs_to :purchase
