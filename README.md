## usersテーブル

| column     | Type   | Option      |
| --------   | ------ | --------    |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |



## prototypesテーブル

| column      | Type       | Option      |
| --------    | ------     | --------    |
| title       | string     | null: false |
| catch_copy  | text       | null: false |
| concept     | text       | null: false |
| user        | references |             |
<!-- | image | ActiveStorageで実装 |   | -->

## commentsテーブル

| column      | Type       | Option      |
| --------    | ------     | --------    |
| text        | text       | null: false |
| user        | references |             |
| prototype   | references |             |