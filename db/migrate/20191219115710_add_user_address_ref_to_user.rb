class AddUserAddressRefToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_addresses, :user, foreign_key: true
  end
end
