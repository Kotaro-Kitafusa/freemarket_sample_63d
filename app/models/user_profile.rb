class UserProfile < ApplicationRecord
  validates :nickname, presence: true
  belongs_to :user
  has_many :products
  has_many :comments, dependent: :destroy
  has_many :saling_products
  has_many :bought_products
  has_many :sold_products
  # 中間テーブル経由でproductsを取得
  has_many :salings, through: :saling_products, source: :product
  has_many :boughts, through: :bought_products, source: :product
  has_many :solds, through: :sold_products, source: :product
  # buyerが購入したproductsをbought_products経由で取得
  has_many :buying_products, class_name: "BoughtProduct", foreign_key: "buyer_id"
  has_many :buyings, through: :buying_products, source: :product
  # buyerが購入済みのproductssold_products経由でを取得
  has_many :accepted_products, class_name: "SoldProduct", foreign_key: "buyer_id"
  has_many :accepts, through: :accepted_products, source: :product
end
