class CreateGiftlists < ActiveRecord::Migration
  def change
    create_table :giftlists do |t|
      t.string :name
      t.string :note
      t.string :giftee
      t.references :user, index: true
    end
  end
end
