class CreateGiftsTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :gifts_tags, id: false do |t|
      t.references :gift
      t.references :tag
    end

    add_reference :gifts, :tag, index: true
  end

end
