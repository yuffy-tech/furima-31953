# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------            | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| na                  | text   | null: false |
| name                | text   | null: false |
| na furigana         | text   | null: false |
| name furigana       | text   | null: false |
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
| jotai_id   | text     | null: false |
| deribery fee_id       | text      | null: false |
| start area_id         | text      | null: false |
| shipping guideline_id | integer   | null: false |
### Association

## shipping address テーブル

| postal code   | text   | null: false |
| prefectures   | text   | null: false |
| municipality  | text   | null: false |
| address       | text   | null: false |
| phone nunber  | text   | null: false |
| security code | text   | null: false |