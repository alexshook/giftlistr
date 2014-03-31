class CreateGiftlistsGiftsJoinTable < ActiveRecord::Migration
  def change
    create_table :giftlists_gifts, id: false do |t|
      t.references :giftlist
      t.references :gift
    end
  end
end
