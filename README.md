# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------            | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| na                  | text   | null: false |
| first_name          | text   | null: false |
| last_name           | text   | null: false |
| first_name_kana     | text   | null: false |
| last_name_kana      | text   | null: false |
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
### Association

### Association

## product テーブル

| Column | Type         | Options     |
| ------ | ------       | ----------- |
| users                 | string    | null: false |
| status_id             | string    | null: false |
| jotai_id              | text     | null: false |
| deribery_fee_id       | text      | null: false |
| start_area_id         | text      | null: false |
| shipping_guideline_id | integer   | null: false |
### Association

## shipping address テーブル

| postal_code   | text   | null: false |
| prefectures   | text   | null: false |
| municipality  | text   | null: false |
| address       | text   | null: false |
| phone_nunber  | text   | null: false |
| security_code | text   | null: false |