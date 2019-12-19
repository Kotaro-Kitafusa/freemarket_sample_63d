class RemoveUserAddressRefFromUserProfile < ActiveRecord::Migration[5.2]
  def change
    remove_reference :user_addresses, :user_profile, foreign_key: true
  end
end
