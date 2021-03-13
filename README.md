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

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
