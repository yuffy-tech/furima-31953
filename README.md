# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------            | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday            | date   | null: false |



### Association
<!-- ユーザーから見て他のテーブルがどうか -->
- has_many :items
- has_many :products

## itemes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name           | string    | null: false |
| pictcher       | string    | null: false |
| description    | text      | null: false |
| details_id     | text      | null: false |
| delivery_id    | text      | null: false |
| price          | integer   | null: false |
| users_id        | string    | null: false |
| itemes_id       | string    | null: false |
### Association
- has_many :items

## product テーブル

| Column | Type         | Options     |
| ------ | ------       | ----------- |
| users                 | string    | null: false |
| status_id             | string    | null: false |
| deribery_fee_id       | text      | null: false |
| start_area_id         | text      | null: false |
| shipping_guideline_id | integer   | null: false |
### Association

## shipping address テーブル

| Column        | Type         | Options     |
| ------        | ------       | ----------- |
| postal_code   | string       | null: false |
| prefectures   | inteder      | null: false |
| municipality  | string       | null: false |
| address       | string       | null: false |
| building_name | string       | null: false |