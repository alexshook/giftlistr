class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.references :giftlist, index: true
    end
  end
end
