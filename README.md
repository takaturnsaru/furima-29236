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
|birthday             |date       | null:false      |

## Association

-has_many :items
-has_many :commemts
-has_many :items, through: :users_items
-has_one :address

## items_テーブル

|Column               |Type           | Options                      |
|---------------------|---------------|------------------------------|
|name                 |string         | null:false                   |
|explanation          |text           | null:false                   |
|category             |integer        | null:false                   |
|status               |integer        | null:false                   |
|shipping_fee         |integer        | null:false                   |
|shipping_area        |integer        | null:false                   |
|day_until_shipping   |integer        | null:false                   |
|price                |integer        | null:false                   |
|user                 |references     | null:false,foregin_key: true |

## Association

-belongs_to :user
-has_many :comments
-has_many :users, through: :users_items

## comments_テーブル

|Column                |Type          |Options                         |
|----------------------|--------------|--------------------------------|
|comment               |string        |                                |
|user                  |references    | null: false, foregin_key: true |
|item                  |references    | null: false, foregin_key: true |

## Association

-belongs_to :user
-belongs_to :item

## users_items_テーブル
｜Column              |Type            |Options                         |
｜--------------------|----------------|--------------------------------|
|user                 |references      |null:false, foregin_key: true   |
|item                 |references      |null:false, foregin_key: true   |

-belongs_to :user
-belongs_to :item
-has_one :address

## Address_テーブル
|Column        | Type              |Options                     |
|--------------|-------------------|----------------------------|
|postal_code   | string            | null:false                 |
|prefectures   | integer           | null:false                 |
|city          | string            | null:false                 |
|address       | string            | null:false                 |
|building_name | string            | default:""                 |
|phone_number  | string            | null:false                 |
|user          | references        | null:false,foregin_key:true|

## Association

-belongs_to :user
-belongs_to :users_item