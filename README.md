# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | text   | null: false |
| name       | text   | null: false |
| birthday   | text   | null: false |
### Association


## itemes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name           | string | null: false |
| pictcher       | string | null: false |
| description    | text   | null: false |
| details        | text   | null: false |
| delivery       | text   | null: false |
| price          | text   | null: false |
### Association

## details テーブル

| name          | text   | null: false |
| category      | text   | null: false |
| satus         | text   | null: false |
| delivery fee  | text   | null: false |
| city          | text   | null: false |
| date and time | text   | null: false |
### Association

## order テーブル

| card number     | text   | null: false |
| expiration date | text   | null: false |
| security code   | text   | null: false |

### Association

## shipping address テーブル

| postal code   | text   | null: false |
| prefectures   | text   | null: false |
| municipality  | text   | null: false |
| address       | text   | null: false |
| phone nunber  | text   | null: false |
| security code | text   | null: false |