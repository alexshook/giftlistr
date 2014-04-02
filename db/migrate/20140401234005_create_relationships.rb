class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :friend_id
      t.integer :other_friend_id
    end
    add_index :relationships, :friend_id
    add_index :relationships, :other_friend_id
    add_index :relationships, [:friend_id, :other_friend_id], unique: true
  end
end
