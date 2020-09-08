## users_テーブル

|Column               |Type       |  Options        |
|---------------------|-----------|-----------------|
|nickname             |string     | null:false      |
|email                |string     | null:false      |
|password             |string     | null:false      |
|password_contirmation|string     | null:false      |
|family_name          |string     | null:false      |
|first_name           |string     | null:false      |
|family_name_reading  |string     | null:false      |
|first_name_reading   |string     | null:false      |
|birth_year           |integer    | null:false      |
|month_of_birth       |integer    | null:false      |
|date_of_month        |integer    | null:false      |

## Association

-has_many :items
-has_many :commemts

## items_テーブル

|Column               |Type           | Options                      |
|---------------------|---------------|------------------------------|
|image                |string         | null:false                   |
|name                 |string         | null:false                   |
|explanation          |text           | null:false                   |
|category             |integer        | null:false                   |
|status               |integer        | null:false                   |
|shipping_fee         |integer        | null:false                   |
|shipping_area        |integer        | null:false                   |
|day_until_shipping   |integer        | null:false                   |
|price                |integer
|user_id              |references     | null:false,foregin_key: true |

## Association

-belongs_to :user
-has_many :comments

## comments_テーブル

|Column                |Type          |Options                         |
|----------------------|--------------|--------------------------------|
|comment               |string        |                                |
|user                  |references    | null: false, foregin_key: true |
|item                  |references    | null: false, foregin_key: true |

## Association

-belongs_to :user
-belongs_to :item




