# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------            | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday            | date   | null: false |



### Association
<!-- ユーザーから見て他のテーブルがどうか -->
- has_many :items
- has_many :managements

## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | inteder    | null: false |
| status_id          | inteder    | null: false |
| delivery_burden_id | inteder    | null: false |
| start_area_id      | inteder    | null: false |
| delivery_day_id    | inteder    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
### Association
- has_one :management
- belongs_to :user

## managements テーブル

| Column  | Type         | Options     |
| ------  | ------       | ----------- |
| user    | references   | null: false, foreign_key: true |
| item    | references   | null: false, foreign_key: true |

### Association
- has_one :shipping_address
- belongs_to :item
- belongs_to :user


## shipping_address テーブル

| Column        | Type         | Options     |
| ------        | ------       | ----------- |
| postal_code   | string       | null: false |
| start_area_id | inteder      | null: false |
| municipality  | string       | null: false |
| address       | string       | null: false |
| building_name | string       | ----------- |
| phone_number  | string       | null: false |
| management    | references   | null: false, foreign_key: true |

### Association
- belongs_to :management