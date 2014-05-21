class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.date :birthday

      t.references :user
    end
  end
end
