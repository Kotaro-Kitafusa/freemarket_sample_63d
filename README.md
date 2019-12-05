## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|profile|text|null: false|
|avator|string||

### Association
- has_one :user_profile
- has_one :user_address
- has_many :products
- has_many :comments
- has_many :saling_products
- has_many :bought_products
- has_many :sold_products

## user_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|e-mail|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_phonetic_guide|string|null: false|
|last_name_phonetic_guide|string|null: false|
|year_of_birth|date|null: false|
|month_of_birth|date|null: false|
|day_of_birth|date|null: false|
|phone_number|integer|null: false|

### Association
- belongs_to :user

## user_addressテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|bland_id|integer|null: false, foreign_key: true|
|description|text|null: false|
|status|integer|null: false|
|who_charge_shipping|integer|null: false|
|way_of_shipping|integer|null: false|
|shipping_region|integer|null: false|
|how_long_shipping|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :saling_product
- belongs_to :bought_product
- belongs_to :sold_product
- belongs_to :brand
- has_many :product_images
- has_many :comments

## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
- has_ancestry

## blandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :product

## saling_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|saling_user_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :user

## bought_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|bought_user_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :user

## sold_productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|sold_user_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :user
