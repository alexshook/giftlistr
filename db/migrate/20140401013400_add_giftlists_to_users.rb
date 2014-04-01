class AddGiftlistsToUsers < ActiveRecord::Migration
  def change
    remove_column :giftlists, :user_id_id
    add_reference :giftlists, :user, index: true
  end
end
