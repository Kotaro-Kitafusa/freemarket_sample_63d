class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile
  has_one :user_address
  with_options presence: true do
  validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birth_day
    validates :phone_number
  end
  #ユーザー登録時に複数のテーブルに保存できるように親=>子へネストさせる
  accepts_nested_attributes_for :user_profile
  accepts_nested_attributes_for :user_address
end
