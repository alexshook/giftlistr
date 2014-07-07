class AddRecipientIdToGiftlists < ActiveRecord::Migration
  def change
    add_column :giftlists, :recipient_id, :integer
  end
end
