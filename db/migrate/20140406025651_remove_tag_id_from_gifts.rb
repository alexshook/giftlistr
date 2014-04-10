class RemoveTagIdFromGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :tag_id
  end
end
